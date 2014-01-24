#########################################################################
#User class stores each of the users moving ratings and determines taste
# Nicholas Cummins
# ncummins@brandeis.edu

require_relative 'rating'

class User

  attr_reader :rating_list

  #initializes the User with his or her first rating
  def initialize(rating)
    move_id = rating.movie_id
    @rating_list = {movie_id: rating}
    @id = rating.user_id
  end

  #Adds a new rating
  def add(rating)
    @rating_list[rating.movie_id] = rating
  end

  #Compares the similarity of two users in terms of movies rated
  def similarity(other_user)
    similarity_count = 0
    @rating_list.each_value do |rating|
      if other_rating = other_user.rating_list[rating.movie_id] and other_rating.rating.to_i >= rating.rating.to_i - 1 and other_rating.rating.to_i <= rating.rating.to_i + 1
        similarity_count += 1
      end
    end
    return similarity_count
  end

  def to_s
    "User #{@id}"
  end
end
