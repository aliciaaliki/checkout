# frozen_string_literal: true

module Promotions
  class TotalDiscount
    attr_reader :min_price, :discount_percentage

    def initialize(min_price, discount_percentage)
      @min_price = min_price
      @discount_percentage = discount_percentage
    end

    def apply(_basket, total)
      discount = 0
      discount = total * discount_percentage if total >= min_price
      discount
    end
  end
end
