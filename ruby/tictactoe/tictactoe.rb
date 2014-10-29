require 'ir_b'

class TicTacToe
  def start
    choice = get_player_choice
    
    case choice
    when "1"
      set_players(HumanPlayer.new("Human A"), HumanPlayer.new("Human B"))
    when "2"
      set_players(HumanPlayer.new("Human"), AIPlayer.new("AI"))
    when "3"
      set_players(AIPlayer.new("AI A"), AIPlayer.new("AI B"))
    else
      throw Exception.new("Unexpected choice #{choice}")
    end
    
    start_game_loop
  end
  
  def get_player_choice
    player_type_selected = false

    while !player_type_selected do
      puts """Please select who will be playing Tic-Tac-Toe.
1 - Player vs Player
2 - Player vs AI
3 - AI vs AI"""

      choice = gets.strip
      player_type_selected = %w{1 2 3}.include?(choice)
    end
    
    puts "You chose #{choice}"
    choice
  end
  
  def set_players(a, b)
    @playerA = a
    @playerA.symbol = "A"

    @playerB = b
    @playerB.symbol = "B"
  end
  
  def start_game_loop
    @board = Board.new
    next_player = @playerA
    
    while !@board.game_ended?
      @board.print_state
      puts "Current player is #{next_player.name}"

      next_player.get_move(@board)
      
      if next_player == @playerA 
        next_player = @playerB
      else
        next_player = @playerA
      end
    end
    
    if @board.winner?
      puts "Player #{@board.get_winner} was the winner!"
    else
      puts "There was no winner! A draw!"
    end
    
    @board.print_state
      
  end

end

class Player
  attr_accessor :symbol, :name
  
  def initialize(name)
    @name = name
  end
end

class HumanPlayer < Player
  def get_move(board)
    board.print_moves
    legal_move = false
    
    while !legal_move do
      move = gets.strip
      legal_move = board.legal_move?(move)

      if !legal_move
        puts "'#{move}' is not a legal move! Please choose one of the available numbers."
      end
    end
    
    board.make_move(move, symbol)
  end
end

class AIPlayer < Player
  def get_move(board)
  end
end

class Board
  def initialize
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end
  
  def game_ended?
    winner? || no_moves_left?
  end
  
  def winner?
    !get_winner.nil?
  end
  
  def get_winner
    check_horizontal_winner || check_horizontal_winner(@board.transpose) ||
    check_diagonal_winner
  end
  
  def check_horizontal_winner(board = @board)
    winning_player_symbol = nil
    
    board.each do |row|
      row = row.uniq
      if row.count == 1 && !row[0].nil?
        winning_player_symbol = row[0]
        break
      end
    end
    
    winning_symbol
  end
  
  def check_diagonal_winner
    collection_of_diagonals = [
      [
        @board[0][0],
        @board[1][1],
        @board[2][2]
      ],
      [
        @board[2][0],
        @board[1][1],
        @board[0][2]
      ]
    ]
    
    check_horizontal_winner(collection_of_diagonals)
  end
  
  def no_moves_left?
    # No moves left if no nils, so see if compacting doesn't change the size
    @board.flatten.compact.count == 9
  end
  
  def print_state
    puts "Current board state:"

    @board.each do |row|
      row.each do |column|
        print column.nil? ? '-' : column
        print " "
      end
      print "\n"
    end
  end
  
  def print_moves
    puts "Enter a number to pick your move"
    i = 1
    @board.each do |row|
      row.each do |column|
        print column.nil? ? i : column
        print " "
        i += 1
      end
      print "\n"
    end
  end
  
  def legal_move?(move)
    i = move.to_i
    
    (1..9).include?(i) && get_board_position(i).nil?
  end
  
  def make_move(move, symbol)
    i = move.to_i
    get_board_position(i, symbol)
  end
  
  def get_board_position(i, change = nil)
    # When calculating x and y, start from index 0, not 1
    j = i - 1
    
    x = j % 3
    y = j / 3
    
    if !change.nil?
      @board[y][x] = change
    end
    
    @board[y][x]
  end
  
end
