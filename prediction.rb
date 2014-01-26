###################################################
# Author: Nicholas Cummins (ncummins@brandeis.edu)
# This class is essentially a placeholder to be used
# by the MovieTest class as it runs each test

class Prediction

  attr_reader :rating, :prediction, :error
  def initialize(u, m, r, p)
    @user = u
    @movie = m
    @rating = r
    @prediction = p
    @error = @rating - @prediction
  end

  def to_s
    "User: #{@user} Movie: #{@movie} Rating: #{@rating} Prediction: #{@prediction}"
  end
end 
