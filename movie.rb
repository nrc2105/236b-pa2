################################################################
#Movie class stores all user ratings and calculates popularity.
#Ratings are added after subtracting 3, meaning the ratings range
#from -2 to 2
# Nicholas Cummins
# ncummins@brandeis.edu

require_relative 'rating'

class Movie
  
  attr_reader :popularity
  #initializes the Movie with its first rating
  def initialize(rating)
    @id = rating.movie_id
    @popularity = rating.rating.to_i - 3
  end

  #Add the newest rating (-3) to the popularity
  def add(rating)
    @popularity += rating.rating.to_i - 3
  end
  
  def to_s
    "Movie #{@id}"
  end
end
