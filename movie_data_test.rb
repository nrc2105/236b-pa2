####################################################
# This test script tests the MovieData class by
# loading in a data file and then printing the 
# top and bottom 10 of the popularity list and the
# users similar to user(1)
# Nicholas Cummins
# ncummins@brandeis.edu

require_relative 'movie_data'

movie_database = MovieData.new
movie_database.read_in_movie_data(ARGV[0])


#Create the list of most popular movies
movie_list = movie_database.popularity_list

#Print top and bottom 10

puts "Top 10 movies:\n"

for i in 0..9

  puts "#{i+1}. #{movie_list[i]}"
end

puts "\nBottom 10 movies:\n"

for i in movie_list.length-10..movie_list.length-1
  
  puts "#{i+1}. #{movie_list[i]}"
end

#Create list of users similar to user 1

similar_user_list = movie_database.most_similar(1)

#Print the top and bottom 10

puts "\nTop 10 most similar users to 1:\n"

for i in 0..9

  puts "#{i+1}. #{similar_user_list[i]}"
end

puts "\nBottom 10 most similar users to 1:\n"
for i in similar_user_list.length-10..similar_user_list.length-1

  puts "#{i+1}. #{similar_user_list[i]}"
end
