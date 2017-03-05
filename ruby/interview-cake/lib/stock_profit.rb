class StockProfit
  class << self
    def find_best_stock_profit(*args)
      find_best_stock_profit1(*args)
    end
    
    def find_best_stock_profit1(prices)
      low = prices[0]
      max_profit = 0
      
      prices.each do |price|
        if price < low
          low = price
        else
          profit = price - low
        
          if profit > max_profit
            max_profit = profit
          end
        end
      end
      
      max_profit
    end
    
    def find_best_stock_profit2(prices, low = prices[0], maxprofit = 0)
      if prices.length == 0
        maxprofit
      else
        price = prices.first
        prices = prices.drop(1)

        if price < low
          find_best_stock_profit2(prices, price, maxprofit)
        else
          find_best_stock_profit2(prices, low, [price - low, maxprofit].max)
        end
      end
    end
    
  end
end