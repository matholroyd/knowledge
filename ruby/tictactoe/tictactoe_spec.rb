require 'rspec'
require './spec_helper'
require './tictactoe'

describe TicTacToe do
  let(:game) { TicTacToe.new }

  context "game setup" do
    it "should start asking for user to pick players" do
      output = capture_stdout do
        game.start
      end
      output.should =~ /select who will be playing Tic-Tac-Toe/
    end
    
    it "should take the user input for player select" do
      game.start
    end
  end
end


