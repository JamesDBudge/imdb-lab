require_relative("../db/sql_runner")
require_relative("movie")
require_relative("star")

class Casting

  attr_accessor :id, :movie_id, :star_id, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
  end

  def save()
    sql = "INSERT INTO castings (movie_id, star_id, fee) VALUES ($1, $2, $3) RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end

  def self.map_items(cast_data)
    results = cast_data.map { |cast| Casting.new(cast)  }
    return results
  end

  def self.all
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    self.map_items(castings)
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE castings SET (fee) = ($1) WHERE id = $2"
    values = [@fee, @id]
    SqlRunner.run(sql, values)
  end



end
