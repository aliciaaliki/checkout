module Promotions
  class TotalDiscount
    attr_reader :min_price, :discount_percentage

    def initialize(min_price, discount_percentage)
      @min_price = min_price
      @discount_percentage = discount_percentage
    end 

    def apply(basket, total)
      discount = 0
      if total >= min_price
        discount = total * discount_percentage
      end
      discount
    end
  end
end