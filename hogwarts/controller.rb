require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('models/student')

#INDEX
get "/students" do
  @students = Student.all()
  erb(:index)
end

#NEW
get "/students/new" do
  @houses = House.all
  erb(:new)
end

#CREATE
post "/students" do
  Student.new(params).save()
  # binding.pry
  erb(:create)
end
