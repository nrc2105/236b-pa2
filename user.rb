#########################################################################
#User class stores each of the users moving ratings and determines taste
# Nicholas Cummins
# ncummins@brandeis.edu

require_relative 'rating'

class User

  attr_reader :rating_list

  #initializes the User with his or her first rating
  def initialize(rating)
    @rating_list = {}
    @id = rating.user_id
    add(rating)
  end

  #Adds a new rating
  def add(rating)
    @rating_list[rating.movie_id] = rating
  end

  #Compares the similarity of two users in terms of movies rated
  def similarity(other_user)
    similarity_count = 0
    @rating_list.each_value do |rating|
      if other_rating = other_user.rating_list[rating.movie_id] and \
        other_rating.rating.to_i >= rating.rating.to_i - 1 and \
        other_rating.rating.to_i <= rating.rating.to_i + 1
        similarity_count += 1
      end
    end
    return similarity_count
  end

  #Returns all movies rated
  def movies
    movies = []
    @rating_list.each_value do |rating|
      movies << rating.movie_id
    end
    return movies
  end

  #Returns the rating given to movie m
  def rating(m)
    @rating_list[m].rating
  end
  
  #Returns the predicted rating
  def predict(m, viewer_list)
    prediction = 0
    similarity_tally = 0
    viewer_list.each do |viewer|
      sim = similarity(viewer) 
      similarity_tally += sim
      prediction += sim * viewer.rating_list[m].rating
    end
    return prediction/similarity_tally.to_f
  end

  def to_s
    "User #{@id}"
  end
end
