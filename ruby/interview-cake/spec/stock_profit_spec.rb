require 'rspec'
require_relative '../lib/stock_profit'

describe StockProfit do
  context "find best stock prices" do
    it "should find the maximum profit in simple example" do
      expect(StockProfit.find_best_stock_profit([1, 9])).to eq(8)
    end

    it "should find the maximum profit in complex examples" do
      expect(StockProfit.find_best_stock_profit([1, 9, 8, 10])).to eq(9)
      expect(StockProfit.find_best_stock_profit([8, 9, 2, 10])).to eq(8)
    end

    it "should return 0 if there is no profit to be made" do
      expect(StockProfit.find_best_stock_profit([9, 1])).to eq(0)
    end
    
    it "should return 0 if there are 1 or less stock prices" do
      expect(StockProfit.find_best_stock_profit([])).to eq(0)
      expect(StockProfit.find_best_stock_profit([1])).to eq(0)
    end
  end
end