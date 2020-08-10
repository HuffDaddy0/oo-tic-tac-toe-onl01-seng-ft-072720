class TicTacToe
attr_accessor :board
attr_reader :WIN_COMBINATIONS

WIN_COMBINATIONS = [[0,3,6],
  [1,4,7],
  [2,5,8],
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6]]


def initialize
  @board = Array.new(9," ")
end


def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, char = "X")
  @board[index] = char
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
 else
   false
 end
end

def valid_move?(index)
  if (0..8).include?(index)
    !position_taken?(index)
  end
end

def turn
  index = input_to_index(gets.chomp)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    puts "That is not a valid move, try again!"
    gets.chomp
  end
end

def turn_count
  count =  @board.find_all {|i| i != " "}
  count.length
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  win = nil
  WIN_COMBINATIONS.each do |win_array|
  if win_array.all? {|win_spot|
  @board[win_spot] == "X"}
  win = win_array
  elsif win_array.all? {|win_spot|
  @board[win_spot] == "O"}
  win = win_array
end
end
win
end

def draw?
  if full?
   !won?
end
end

def full?
  @board.none? {|i| i == " "}
end

def winner
  if won? != nil
  if won?.all? {|i| @board[i] == "X"}
    "X"
  elsif won?.all? {|i| @board[i] == "O"}
  "O"
else
  nil
  end
end
end

def over?
  if won?
    true
  elsif draw?
    true
  elsif !full?
    false
    end
  end

def play
   until over?
     turn
   end

   if won?
     puts "Congratulations #{winner}!"
  elsif draw?
    puts"Cat's Game!"
   end
 end

end
