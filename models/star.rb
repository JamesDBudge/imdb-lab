require('pry')
require_relative('../db/sql_runner')
class Star

  attr_accessor :id, :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars (first_name, last_name) VALUES ($1, $2) RETURNING id;"
    values = [@first_name, @last_name]
    # binding.pry
    star = SqlRunner.run(sql, values).first
    @id = star['id'].to_i
  end

  def self.map_items(star_data)
    results = star_data.map { |star| Star.new(star)  }
    return results
  end

  def self.all
    sql = "SELECT * FROM stars"
    stars = SqlRunner.run(sql)
    self.map_items(stars)
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE stars SET (first_name, last_name) = ($1, $2) WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def movies()
    sql = "SELECT movies.* FROM movies
    INNER JOIN castings
    ON castings.movie_id = movies.id
    WHERE castings.star_id = $1"
    values = [@id]
    movies = SqlRunner.run(sql, values)
    return Movie.map_items(movies)
  end




end
