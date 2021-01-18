# frozen_string_literal: true

module Promotions
  class ProductMultibuyPrice
    attr_reader :product_code, :min_number, :price, :discounted_price

    def initialize(product_code, min_number, price, discounted_price)
      @product_code = product_code
      @min_number = min_number
      @price = price
      @discounted_price = discounted_price
    end
  end
end
