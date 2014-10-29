class Player
  attr_accessor :symbol, :other_player_symbol
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

