
  # -------------------------
  module Identifiable
  def self.included(base)
  base.extend(ClassMethods)
  end

  module ClassMethods
  def next_id
  @counter ||= 0
  @counter += 1
  end
  end

  def assign_id
  @id ||= self.class.next_id
  end

  def id
  assign_id
  end
  end

  class Person
  include Identifiable
  include Enumerable


  attr_accessor :first_name, :last_name, :email


  def initialize(first_name:, last_name:, email: nil)
  @first_name = first_name
  @last_name = last_name
  @email = email
  assign_id
  end


  def full_name
  "#{first_name} #{last_name}"
  end


  # allow enumerating over attributes
  def each
  yield :id, id
  yield :first_name, first_name
  yield :last_name, last_name
  yield :email, email
  end


  def to_h
  Hash[map { |k, v| [k, v] }]
  end


  def to_json(*_args)
  to_h.to_json
  end


  def inspect
  "#<Person #{id} \"#{full_name}\">"
  end
  end


  class Employee < Person
  attr_accessor :position, :salary


  def initialize(first_name:, last_name:, email: nil, position: 'Employee', salary: 0)
  super(first_name: first_name, last_name: last_name, email: email)
  @position = position
  @salary
