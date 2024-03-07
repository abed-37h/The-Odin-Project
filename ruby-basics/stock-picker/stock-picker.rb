

def stock_picker(prices)
  optimal_buying_day = 0
  optimal_selling_day = 0

  buying_day = 0
  prices.each_with_index do |current_price, current_day|
    if current_price < prices[buying_day]
      buying_day = current_day
    elsif current_price - prices[buying_day] > prices[optimal_selling_day] - prices[optimal_buying_day]
      optimal_selling_day = current_day
      optimal_buying_day = buying_day
    end
  end

  [optimal_buying_day, optimal_selling_day]
end

# Tests
puts stock_picker([17,3,6,9,15,8,6,1,10]).to_s
puts stock_picker([7,1,5,3,6,4]).to_s
puts stock_picker([7,6,4,3,1]).to_s
