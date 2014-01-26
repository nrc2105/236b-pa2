##########################
# Author: Nicholas Cummins
# This script tests the functionality
# of MovieTest


require_relative 'movie_data'

z = MovieData.new
z.read_in_movie_data(ARGV[0])

mov_test = z.run_test(20)

#puts "Array: #{mov_test.predictions}"
puts "Mean: #{mov_test.mean} Stddev: #{mov_test.stddev} RMS: #{mov_test.rms}"


