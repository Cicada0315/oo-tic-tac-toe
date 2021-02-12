class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
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

  def input_to_index(st)
    st.to_i-1
  end

  def move(index, player)
    @board[index]=player
  end

  def position_taken?(index)
    return @board[index]== "X" || @board[index]== "O"
  end

  def valid_move?(index)
    return !position_taken?(index) && index.between?(0,8)
  end
    
  def turn_count
    count=0
    @board.each do |index| count+=1 if index=="X" || index=="O"
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end   
    
  def turn
    index_string=gets
    index=input_to_index(index_string)
    if !valid_move?(index) 
      turn
    else
      move(index, current_player)
      display_board
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
        return combo
      end
    end
    return false
  end
    
  def full?
    if turn_count==@board.size
      return true
    else 
      return false
    end
  end

  def draw?
    return !won? && full?
  end

  def over?
    if draw? || won? || full?
      return true
    else 
      return false
    end
  end

  def winner
    index = []
    index = won?
    if index == false
      return nil
    elsif over? == true
      if @board[index[0]] == "X"
        return "X"
      elsif @board[index[0]] == "O"
        return "O"
      end
    end
  end

  def play
    until over?
      turn
    end
    if won?
      if winner == "X" || winner == "O"
        puts "Congratulations #{winner}!" 
      end
    elsif draw?
        puts "Cat\'s Game!"
    end
  end
end