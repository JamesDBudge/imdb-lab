require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')
require('pry-byebug')

Star.delete_all()
Movie.delete_all()
Casting.delete_all()

star1 = Star.new({'first_name' => 'Leonardo', 'last_name' => 'di Caprio'})
star1.save()
star2 = Star.new({'first_name' => 'Kate', 'last_name' => 'Winslet'})
star2.save()
star3 = Star.new({'first_name' => 'Jonah', 'last_name' => 'Hill'})
star3.save()

movie1 = Movie.new({'title' => 'Titanic', 'genre' => 'Romance'})
movie1.save()
movie2 = Movie.new({'title' => 'Wolf of Wall Street', 'genre' => 'comedy'})
movie2.save()

casting1 = Casting.new({'fee' => '1000000', 'star_id' => star1.id, 'movie_id' => movie1.id})
casting1.save()
casting2 = Casting.new({'fee' => '1500000', 'star_id' => star1.id, 'movie_id' => movie2.id})
casting2.save()
casting3 = Casting.new({'fee' => '1000000', 'star_id' => star2.id, 'movie_id' => movie1.id})
casting3.save()
casting4 = Casting.new({'fee' => '1500000', 'star_id' => star3.id, 'movie_id' => movie2.id})
casting4.save()

movie1.genre = "chick flick"
movie1.update()


binding.pry
nil
