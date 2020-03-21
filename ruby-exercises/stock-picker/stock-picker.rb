def stock_picker(daily_prices)
    greatest_profit = nil
    best_trade = []

    daily_prices.each_with_index do |price, i|
        for inner_i in (i..daily_prices.length - 1)
            profit = daily_prices[inner_i] - price
            if greatest_profit == nil || profit > greatest_profit
                greatest_profit = profit
                best_trade = [i, inner_i]
            end
        end        
    end

    best_trade
end

puts stock_picker([17,3,6,9,15,8,6,1,10])