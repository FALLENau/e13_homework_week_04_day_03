require_relative('../db/sql_runner')

class House

  attr_reader :name, :url, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @url = options['url']
  end

  def save
    sql = "INSERT INTO houses (
      name, url
      ) VALUES (
      '#{@name}', '#{@url}')
      RETURNING id"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id=#{id}"
    house = SqlRunner.run( sql )
    result = House.new( house.first )

    return result
  end

end