require_relative '../lib/boggle'
require 'active_record'
require_relative '../lib/word.rb'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "./db/words.sqlite"
)

# binding.pry

f = File.open('./testinputs.txt')
num_tests = f.gets.strip.to_i

num_tests.times do |test_index|
  first_row  = f.gets.strip.split(' ')
  second_row = f.gets.strip.split(' ')
  third_row  = f.gets.strip.split(' ')
  fourth_row = f.gets.strip.split(' ')
  answer = f.gets.strip.to_i

  board = [first_row, second_row, third_row, fourth_row]
  boggs = Boggle.new(board)
  boggs.display_board
  calculation = boggs.solve
  puts "Expected: #{answer} words; Found: #{calculation}"
end
f.close
