class TicTacToe
  WIN_COMBINATIONS = [ 
    [0,1,2], 
    [3,4,5],
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8], 
    [6,4,2] 
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    return index = input.to_i - 1
  end 
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end 
  
  def position_taken?(location)
    @board[location] != " " &&
    @board[location] != nil
  end
  
  def valid_move?(input)
    true if input.between?(0,8) && position_taken?(input) == false
  end 
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end #count the total amount of tokens 
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end #x if even turn count
 
  def turn 
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else 
      turn
    end 
  end
  
  def won?
   WIN_COMBINATIONS.each do |combo|
     indexone = combo[0]
     indextwo = combo[1]
     indexthree = combo[2]
     
     position_1 = @board[indexone] 
     position_2 = @board[indextwo] 
     position_3 = @board[indexthree] 
     
    if position_1 == position_2 && position_2 ==   position_3 && position_taken?(indexone)
       combo 
       return combo 
    end
  end
end
  
  def full?
   @board.all? {|i| i == "X" || i == "O"}
  end 

end

