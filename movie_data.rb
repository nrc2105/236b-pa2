##################################################################
#The MovieData class reads in the file, and stores it as a list
#of users and movies
#Nicholas Cummins
#ncummins@brandeis.edu

require 'csv'
require_relative 'rating'
require_relative 'movie'
require_relative 'user'

class MovieData

  attr_reader :user_list
  
  #Initializes empty hashes of movies and users
  def initialize
    @movie_list = {}
    @user_list = {}
    @count = 0
  end

  #Reads in a file separated by tabs and creates a new rating, 
  #then calls the appropriate add methods
  def read_in_movie_data(file_name)
    CSV.foreach(file_name, headers: "user_id\tmovie_id\trating\ttimestamp",\
                col_sep:"\t") do |row|
      temp_rating = Rating.new(row["user_id"].to_i,row["movie_id"].to_i,\
                               row["rating"].to_i,row["timestamp"].to_i)
      add_movie(temp_rating)
      add_user(temp_rating)
      @count = @count + 1
    end
  end

  #Checks to see if the movie already resides on the list, otherwise adds it
  def add_movie(rating)
    if movie_temp = @movie_list[rating.movie_id]
      movie_temp.add(rating)
    else
      @movie_list[rating.movie_id] =  Movie.new(rating)
    end
  end

  #Checks to see if the user already resides on the list, otherwise adds it
  def add_user(rating)
    if user_temp = @user_list[rating.user_id]
      user_temp.add(rating)
    else
      @user_list[rating.user_id] = User.new(rating)
    end
  end

  #If the desired movie is on the list, returns the popularity
  def popularity(id_number)
    if temp_movie = @movie_list[id_number]
      return temp_movie.popularity
    else
      return "Movie not in data set"
    end
  end

  #Creates and print out a list of movies in order of popularity
  def popularity_list
    @movie_list.values.sort{|a,b| b.popularity <=> a.popularity}
  end

  #Returns an integer representing the similarity between two users
  def similarity(user1, user2)
    return @user_list[user1].similarity(@user_list[user2])
  end

  #Using the similarity function, returns a list of similar users
  def most_similar(u)
    @user_list.values.sort{|a,b|  @user_list[u].similarity(b) <=> @user_list[u].similarity(a)}
  end

  #Returns the rating a user u gave movie m in the training set, 0 if no rating
  def rating(u, m)
    @user_list[u].rating(m)
  end

  #Returns a floating point prediction as an estimate of what user u would
  #rate movie m
  def predict(u,m)
  end

  #Returns array of movies that user u has watched
  def movies(u)
    @user_list[u].movies
  end
end
