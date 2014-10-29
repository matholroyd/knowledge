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
    best_move = nil
    best_score = -99

    board.possible_moves.each do |i|
      b = board.copy
      b.make_move(i, symbol)
      score = find_min_max_move(b, :min_player)
      if score > best_score
        best_move = i
        best_score = score
      end
    end

    board.make_move(best_move, symbol)
    true
  end

  # From https://en.wikipedia.org/wiki/Minimax
  def find_min_max_move(board, player_type)
    winner = board.get_winner
    if !winner.nil?
      score = winner == symbol ? 1 : -1
    elsif board.no_moves_left?
      0
    elsif player_type == :max_player
      bestValue = -99
      board.possible_moves.each do |i|
        b = board.copy
        b.make_move(i, symbol)
        bestValue = [find_min_max_move(b, :min_player), bestValue].max
      end
      bestValue
    else
      bestValue = 99
      board.possible_moves.each do |i|
        b = board.copy
        b.make_move(i, other_player_symbol)
        bestValue = [find_min_max_move(b, :max_player), bestValue].min
      end
      bestValue
    end
  end
  
end

