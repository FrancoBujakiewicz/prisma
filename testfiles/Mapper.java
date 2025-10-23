
 package com.latteIceCream.latte.mapper;

 import com.latteIceCream.latte.builder.Builder;
 import com.latteIceCream.latte.domain.superclass.DomainEntity;
 import com.latteIceCream.latte.dto.interfaces.DTO;
 import com.latteIceCream.latte.mapper.impl.*;

 import java.lang.reflect.Constructor;
 import java.lang.reflect.ParameterizedType;
 import java.lang.reflect.Type;
 import java.lang.reflect.RecordComponent;
 import java.lang.reflect.Parameter;
 import java.lang.reflect.Method;

 import java.util.Collection;
 import java.util.List;

 import org.springframework.beans.factory.annotation.Autowired;

 import java.util.ArrayList;

 import static java.util.Collections.emptyList;

 public sealed abstract class Mapper<D extends DTO<?>, E extends DomainEntity<E>>

 permits
 BrandMapper,
 FlavorMapper,
 ProductMapper,
 PermissionMapper,
 RoleMapper,
 SizeMapper,
 UserMapper

 {

    @Autowired
    protected Builder<E> builder;

    // Class references
    protected final Class<D> dtoClass;
    protected final Class<E> entityClass;

    // Constructors
    protected final Constructor<D> dtoConstructor;
    protected final Constructor<E> entityConstructor;

    // DTO metadata
    protected final RecordComponent[] dtoComponents;
    protected final Method[] dtoMethods;

    // Entity metadata
    protected final Method[] entityGetters;
    protected final boolean[] isRelationshipField;
    protected final boolean[] isCollectionRelationship;
    protected final String[] entityFieldNames;

    // TODO: Debug all
    // TODO: Exceptions -> Errors

    @SuppressWarnings("unchecked")
    protected Mapper() {

       try {

          // Extract generic types
          Type superClass = getClass().getGenericSuperclass();
          ParameterizedType parameterizedType = (ParameterizedType) superClass;
          Type[] typeArguments = parameterizedType.getActualTypeArguments();

          this.dtoClass = (Class<D>) typeArguments[0];
          this.entityClass = (Class<E>) typeArguments[1];

          // Initialize DTO metadata
          this.dtoComponents = dtoClass.getRecordComponents();
          this.dtoMethods = dtoMethods();
          this.dtoConstructor = dtoCanonicalConstructor();

          // Initialize relationship mappings
          this.isRelationshipField = relationshipFlags();
          this.isCollectionRelationship = collectionRelationshipFlags();
          this.entityFieldNames = entityFieldNames();

          // Initialize entity metadata
          this.entityGetters = entityGetters();
          this.entityConstructor = entityClass.getConstructor(builder.getClass());

       }

       catch (NoSuchMethodException e)

       { throw new RuntimeException("Failed to initialize Mapper: "+e.getMessage(), e); }

    }

    public D toDTO(E entity) {

       try {

          Object
          values[] = new Object[dtoComponents.length],
          entityFieldValue;

          for(int i = 0; i < dtoComponents.length; i++) {

             if(isRelationshipField[i]) {

                // Get entity relationship field value
                entityFieldValue = entityGetters[i].invoke(entity);

                if(isCollectionRelationship[i]) values[i] = extractIds(entityFieldValue);

                else values[i] = extractSingleId(entityFieldValue);

             } else values[i] = entityGetters[i].invoke(entity);

           } return dtoConstructor.newInstance(values);

        }

        catch (Exception e) { throw new RuntimeException("CONVERSION FAILED!!: "+e.getMessage(), e); }

    }

    public E toEntity(D dto) {

       try {

          Parameter[] constructorParams = entityConstructor.getParameters();
          Object[] constructorArgs = new Object[constructorParams.length];
          String paramName;

          for(int p = 0; p < constructorParams.length; p++) {

             paramName = constructorParams[p].getName();

             // Find corresponding DTO value
             for(int d = 0; d < dtoComponents.length; d++) {

                if(dtoComponents[d].getName().equals(paramName) && !isRelationshipField[d])

                { constructorArgs[p] = dtoMethods[d].invoke(dto); break; }

             }

          } return entityConstructor.newInstance(constructorArgs);

       } catch (Exception e) { throw new RuntimeException("CONVERSION FAILED!!: "+e.getMessage(), e); }

    }

    @SuppressWarnings("unchecked")
    protected Constructor<D> dtoCanonicalConstructor() throws NoSuchMethodException {

       Constructor<D>[] constructors = (Constructor<D>[]) dtoClass.getConstructors();

       if(constructors.length == 1) return constructors[0];

       else {

          Class<?>[] paramTypes = new Class<?>[dtoComponents.length];

          for(int i = 0; i < dtoComponents.length; i++) paramTypes[i] = dtoComponents[i].getType();

          return dtoClass.getConstructor(paramTypes);

       }

    }

    protected Method[] dtoMethods() {

       Method[] methods = new Method[dtoComponents.length];

       for(int i = 0; i < dtoComponents.length; i++) {

          try { methods[i] = dtoClass.getMethod(dtoComponents[i].getName()); }

          catch (NoSuchMethodException e)

          { throw new RuntimeException("DTO getter not found: "+dtoComponents[i].getName(), e); }

       } return methods;

    }

    protected boolean[] relationshipFlags() {

       boolean[] flags = new boolean[dtoComponents.length];
       String fieldName;

       for(int i = 0; i < dtoComponents.length; i++) {

          fieldName = dtoComponents[i].getName();
          flags[i] = fieldName.endsWith("Id") || fieldName.endsWith("Ids");

       } return flags;

    }

    protected boolean[] collectionRelationshipFlags() {

       boolean[] flags = new boolean[dtoComponents.length];

       for(int i = 0; i < dtoComponents.length; i++)

       flags[i] = dtoComponents[i].getName().endsWith("Ids");

       return flags;

    }

    protected String[] entityFieldNames() {

       String
       names[] = new String[dtoComponents.length],
       dtoFieldName;

       int
       idsIndex,
       idIndex;

       for(int i = 0; i < dtoComponents.length; i++) {

          dtoFieldName = dtoComponents[i].getName();

          if(isRelationshipField[i]) {

             idsIndex = dtoFieldName.length() - 3;
             idIndex = dtoFieldName.length() - 2;

             if(dtoFieldName.endsWith("Ids")) names[i] = dtoFieldName.substring(0, idsIndex);
             else if(dtoFieldName.endsWith("Id")) names[i] = dtoFieldName.substring(0, idIndex);

          } else names[i] = dtoFieldName;

       } return names;

    }

    protected Method[] entityGetters() {

       Method[] methods = new Method[dtoComponents.length];

       String
       entityFieldName,
       getterName;

       for(int i = 0; i < dtoComponents.length; i++) {

          entityFieldName = entityFieldNames[i];
          getterName = "get"+Character.toUpperCase(entityFieldName.charAt(0))+entityFieldName.substring(1);

          try {

             methods[i] = findMethod(entityClass, getterName);

             if(methods[i] == null) throw new RuntimeException("Entity getter not found: "+getterName);

          } catch (Exception e) { throw new RuntimeException("Failed to find getter: "+getterName, e); }

       } return methods;

    }

   // ============= HELPER METHODS =============

    protected Method findMethod(Class<?> clazz, String methodName) {

       while (clazz != null && clazz != Object.class) {

          try { return clazz.getDeclaredMethod(methodName); }

          catch (NoSuchMethodException e) { clazz = clazz.getSuperclass(); }

       } return null;

    }

    @SuppressWarnings("unchecked")
    protected List<Long> extractIds(Object entityCollection) {

       if(entityCollection == null) return emptyList();

       if(!(entityCollection instanceof Collection))

       throw new RuntimeException("Expected collection but got: "+entityCollection.getClass());

       Collection<E> collection = (Collection<E>) entityCollection;
       DomainEntity[] entityArray = collection.toArray(new DomainEntity[0]);

       List<Long> ids = new ArrayList<>();
       Long id;

       for(int i = 0; i < entityArray.length; i++) {

          id = entityArray[i].getId();
          if(entityArray[i] != null && id != null) ids.add(id);

       } return ids;

    }

    protected Long extractSingleId(Object entity) {

        if(entity == null) return null;

        if(!(entity instanceof DomainEntity))

        throw new RuntimeException("Entity must extend DomainEntity: "+entity.getClass());

        return ((DomainEntity) entity).getId();

    }

 }

