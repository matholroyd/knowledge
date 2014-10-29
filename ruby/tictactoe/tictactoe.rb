require 'ir_b'
require './dbc'
require './board'
require './player'
require './human_player'
require './ai_player'

class TicTacToe
  def start
    choice = get_player_choice
    
    case choice
    when "1"
      set_players(HumanPlayer.new("Human A"), HumanPlayer.new("Human B"))
    when "2"
      set_players(HumanPlayer.new("Human"), AIPlayer.new("AI"))
    when "3"
      set_players(AIPlayer.new("AI"), HumanPlayer.new("Human"))
    when "4"
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
1 - Human vs Human
2 - Human vs AI (Human first)
3 - Human vs AI (AI first)
4 - AI vs AI"""

      choice = gets.strip
      player_type_selected = %w{1 2 3 4}.include?(choice)
    end
    
    puts "You chose #{choice}"
    choice
  end
  
  def set_players(a, b)
    DBC.require(a.is_a?(Player))
    DBC.require(b.is_a?(Player))
    DBC.require(a != b)
    
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

