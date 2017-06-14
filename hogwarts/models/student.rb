require_relative('../db/sql_runner')
require_relative('house')

class Student

  attr_reader :first_name, :last_name, :house_id, :age, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students (
      first_name, last_name, house_id, age
      ) VALUES (
      '#{@first_name}', '#{last_name}', '#{house_id}', '#{age}')
      RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  def house
    sql = "SELECT * FROM houses
    WHERE id = #{@house_id}"
    house_hash = SqlRunner.run(sql).first
    return House.new(house_hash)
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run( sql )
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM students WHERE id=#{id}"
    student = SqlRunner.run( sql )
    result = Student.new( student.first )

    return result
  end

end