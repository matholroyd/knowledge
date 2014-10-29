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
