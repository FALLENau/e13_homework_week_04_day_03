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
  erb(:new)
end

#CREATE
post "/students" do
  @student = Student.new(params)
  # binding.pry
  @student.save()
  erb(:create)
end