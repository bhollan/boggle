class Boggle
  attr_accessor :words
  attr_reader :board

  def initialize(board)
    @board = board
    @words = []
    @solved = false
    self.solve
  end

  def display_board
    puts "The board"
    4.times do |row_index|
      4.times do |col_index|
        print "#{@board[row_index][col_index]} "
      end
      print "\n"
    end
    puts ""
  end

  def solve
    return 0 if @solved == true
    #ITERATIVE BUILDING AND WINNOWING
    #
    #formulate list of all 3-letter words(2-letter words are zero points and no fun)
    #there should be:
    #4 corners: 60 = (4+4+7)*4
    #8 edges:   192 = (4+7+7+4+2)*8
    #4 centers: 160 =  (2+4+4+7+7+7+4+3+2)*4
    #total 3-letter word candidates: 412
    #
    #check if any are total words from dictionary
    #add those to found_words (already present? prevent duplicates)
    #check if any of them are the start of words from the dictionary
    #reject all others
    #"top up" candidates list by adding a letter to each word where possible
    #repeat until candidates is empty
    candidates = {}
    #treat "row,col,row,col,row,col" as the 'key', and the "word" as the 'value'
    #This is kind of like an "initialize" method where we simply make each letter a candidate
    @board.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        # binding.pry
        candidates["#{row_index}#{col_index}"] = @board[row_index][col_index]
        #{"00"=>"a", "01"=>"a", "02"=>"a", "03"=>"a", "04"=>"a", ..., "44"=>"a"}
      end
    end
    2.times do |index|
      candidates = self.add_a_letter_to_all(candidates)
    end
    @solved = true
    0
  end

  #This would be an ideal time to have rehearsed binary trees in Ruby!  :D
  #You could have a word be found by connecting letters as nodes in the tree

  def add_a_letter_to_all(input_cands)
    #for each key/value pair, add a letter onto the word, but
    #make sure you don't "re-use" a position
    #that's already in that word (key/value pair)
    input_cands.each do |key, val|
      # binding.pry
    end
    input_cands
  end
end
