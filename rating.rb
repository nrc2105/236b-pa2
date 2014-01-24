#################################################################
#The Rating class will store each row of the file and will be used
#by Movie and User objects to determine popularity, tastes, etc
# Nicholas Cummins
# ncummins@brandeis.edu

class Rating

  attr_reader :user_id, :movie_id, :rating, :timestamp

  #Initializes the rating with its various attributes
  def initialize(user_id,movie_id,rating,timestamp)
    @user_id = user_id
    @movie_id = movie_id
    @rating = rating
    @timestamp = timestamp
  end

 def to_s
   "User ID: #{@user_id} Movie ID: #{@movie_id} Rating: #{@rating}"
 end
end

