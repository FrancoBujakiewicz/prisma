
  def greet(name)
    "Hello, #{name}!"
  end

  name = "Alice"
  age = 25

  if age >= 18
    puts "#{name} is an adult."
  else
    puts "#{name} is a minor."
  end

  fruits = ["apple", "banana", "cherry"]
  fruits.each do |fruit|
    puts "I like #{fruit}"
  end

  puts greet(name)

  5.times do |i|
    puts "Counting: #{i + 1}"
  end
