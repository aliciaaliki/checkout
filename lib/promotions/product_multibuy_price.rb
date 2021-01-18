module Promotions
  class ProductMultibuyPrice
    attr_reader :product_code, :min_number, :old_price, :discounted_price

    def initialize(product_code, min_number, old_price, discounted_price)
      @product_code = product_code
      @min_number = min_number
      @old_price = old_price
      @discounted_price = discounted_price
    end

    def apply(basket, _total)
      discount = 0
      count = basket.count { |item| item.code == product_code }
      if count >= min_number
        discount = count * (old_price - discounted_price)
      end
      discount
    end
  end
end