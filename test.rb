require_relative 'rating'
require_relative 'movie_data'
z = MovieData.new

z.add_rating(Rating.new(1,1,5,88989))
z.add_rating(Rating.new(1,2,4,90909))
z.add_rating(Rating.new(2,2,4,90900))
z.add_rating(Rating.new(2,3,3,90909))
z.add_rating(Rating.new(3,2,4,90909))
z.add_rating(Rating.new(3,3,2,90900))
z.add_rating(Rating.new(1,3,3,90909))


#puts z.movies(1)
puts "User 1 rated movie 1: #{z.rating(1, 1)}"
puts "Movie 2 has been seen by: #{z.viewers(2)}"
puts "User 1 will rate movie 3: #{z.predict(1,3)}"

puts "Popularity of movie 1: #{z.popularity(1)}"
puts "Popularity of movie 47: #{z.popularity(47)}"

mov_test = z.run_test

puts mov_test.predictions

puts mov_test.mean
puts mov_test.stddev
puts mov_test.rms
