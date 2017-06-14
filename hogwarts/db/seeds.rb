require_relative('../models/student')
require_relative('../models/house')
require("pry")

house1 = House.new({
  "name" => "Gryffindor",
  "url" => "http"
  })
house1.save
house2 = House.new({
  "name" => "Ravenclaw",
  "url" => "http"
  })
house2.save
house3 = House.new({
  "name" => "Hufflepuff",
  "url" => "http"
  })
house3.save
house4 = House.new({
  "name" => "Slytherin",
  "url" => "http"
  })
house4.save


student1 = Student.new({
  "first_name" => "Walter",
  "last_name" => "Mitty",
  "house_id" => house1.id,
  "age" => 10
  })
student1.save

student2 = Student.new({
  "first_name" => "Fred",
  "last_name" => "Flinstone",
  "house_id" => house2.id,
  "age" => 12
  })
student2.save

binding.pry
nil


