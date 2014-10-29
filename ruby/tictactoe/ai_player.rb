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
    DBC.require([:max_player, :min_player].include?(player_type))
    
    score = nil
    winner = board.get_winner
    
    if !winner.nil?
      score = winner == symbol ? 1 : -1
    elsif board.no_moves_left?
      score = 0
    elsif player_type == :max_player
      score = -99
      board.possible_moves.each do |i|
        b = board.copy
        b.make_move(i, symbol)
        score = [find_min_max_move(b, :min_player), score].max
      end
    else
      score = 99
      board.possible_moves.each do |i|
        b = board.copy
        b.make_move(i, other_player_symbol)
        score = [find_min_max_move(b, :max_player), score].min
      end
    end
    
    score
  end
  
end

