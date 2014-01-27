################################################################
#Movie class stores all user ratings and calculates popularity.
#Ratings are added after subtracting 3, meaning the ratings range
#from -2 to 2
# Nicholas Cummins
# ncummins@brandeis.edu

require_relative 'rating'

class Movie
  
  attr_reader :popularity, :viewers
  #initializes the Movie with empty popularity and viewer lists
  def initialize
    @popularity = 0
    @viewers = []
  end

  #Add the newest rating (-3) to the popularity
  def add(rating)
    @popularity += rating.rating - 3
    @viewers << rating.user_id
  end
end
