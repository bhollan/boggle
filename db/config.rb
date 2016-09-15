require 'active_record'
require_relative '../lib/word.rb'
require 'pry'

# ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => ":memory:"
)

ActiveRecord::Schema.define do
  create_table :words do |table|
    table.column :word, :string
  end
end

f = File.open("./en.txt", "r")

274801.times do |line|
  Word.create({word: f.gets.strip})
end
binding.pry
