##################################################
# Author: Nicholas Cummins (ncummins@brandeis.edu)
# The MovieTest class creates an object that tests
# predictions and analyzes them

require_relative 'rating'
require_relative 'prediction'
require_relative 'movie_data'

class MovieTest

  attr_reader :predictions, :mean

  #Initializes the MovieTest Object and runs the predictions
  def initialize(k, test_set, database)
    @test_set = test_set
    @database = database
    @count = k
    @predictions = []
    run_test
    @mean = mean_calc
  end

  #Runs the test predictions
  def run_test
    for i in 0..@count-1
      @predictions << Prediction.new(@test_set[i].user_id,@test_set[i].movie_id, @test_set[i].rating,@database.predict(@test_set[i].user_id, @test_set[i].movie_id))
    end
  end

  #Calculates average prediction error
  def mean_calc
    error = 0
    @predictions.each do |p|
      error += p.error
    end
    return error/@predictions.size.to_f
  end

  #Calculates the standard deviation
  def stddev
    deviation = 0
    @predictions.each do |p|
      deviation += (p.error - @mean) * (p.error-@mean)
    end
    return Math.sqrt(deviation/predictions.size)
  end

  #Calculates the root mean square
  def rms
    p_error = 0
    @predictions.each do |p|
      p_error += (p.error)*(p.error)
    end
    return Math.sqrt(p_error/predictions.size)
  end

end
  
    
