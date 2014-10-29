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
    @playerA.other_player_symbol = "B"

    @playerB = b
    @playerB.symbol = "B"
    @playerB.other_player_symbol = "A"
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
  attr_accessor :symbol, :name, :other_player_symbol
  
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
    win_if_possible(board) || stop_other_player_winning_if_possible(board) || 
    make_dumb_move(board)
    # pick_good_spot(board)
    
    # make_dumb_move(board)
  end
  
  def win_if_possible(board)
    made_move = false
    
    board.each_with_index do |move, i|
      if move.nil?
        board.make_move(i, symbol)

        if board.get_winner == symbol
          made_move = true
          break
        end

        board.make_move(i, nil)
      end
    end
    
    made_move
  end
  
  def stop_other_player_winning_if_possible(board)
    made_move = false
    
    board.each_with_index do |move, i|
      if move.nil?
        board.make_move(i, other_player_symbol)
        if board.get_winner == other_player_symbol
          # Replace temporary move with other player symbol with my symbol
          board.make_move(i, symbol)
          made_move = true
          break
        end

        board.make_move(i, nil)
      end
    end
    
    made_move
  end
  
  def pick_good_spot(board)
  end
  
  def make_dumb_move(board)
    board.each_with_index do |place, i|
      if place.nil?
        board.make_move(i, symbol)
        break
      end
    end
  end
end

class Board
  include Enumerable
  
  attr_accessor :places
  
  def initialize(places = nil)
    if places.nil?
      @places = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    else
      @places = Array.new(board.places)
    end
  end
  
  def game_ended?
    winner? || no_moves_left?
  end
  
  def winner?
    !get_winner.nil?
  end
  
  def get_winner
    check_horizontal_winner || check_horizontal_winner(places.transpose) ||
    check_diagonal_winner
  end
  
  def check_horizontal_winner(places = @places)
    winning_player_symbol = nil
    
    places.each do |row|
      row = row.uniq
      if row.count == 1 && !row[0].nil?
        winning_player_symbol = row[0]
        break
      end
    end
    
    winning_player_symbol
  end
  
  def each(&block)
    places.flatten.each(&block)
  end
  
  def check_diagonal_winner
    collection_of_diagonals = [
      [
        places[0][0],
        places[1][1],
        places[2][2]
      ],
      [
        places[2][0],
        places[1][1],
        places[0][2]
      ]
    ]
    
    check_horizontal_winner(collection_of_diagonals)
  end
  
  def no_moves_left?
    # No moves left if no nils, so see if compacting doesn't change the size
    places.flatten.compact.count == 9
  end
  
  def print_state
    puts "Current board state:"

    places.each do |row|
      row.each do |column|
        print column.nil? ? '-' : column
        print " "
      end
      print "\n"
    end
  end
  
  def print_moves
    puts "Enter a number to pick your move"
    i = 0
    places.each do |row|
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
    
    (0..8).include?(i) && get_position(i).nil?
  end
  
  def make_move(move, symbol)
    i = move.to_i
    set_position(i, symbol)
  end
  
  def get_position(i)
    x = i % 3
    y = i / 3
        
    places[y][x]
  end
  
  def set_position(i, change)
    x = i % 3
    y = i / 3
    
    places[y][x] = change
  end
  
  
end
