# frozen_string_literal: true

module Promotions
  class TotalDiscount
    attr_reader :min_price, :discount_percentage

    def initialize(min_price, discount_percentage)
      raise Error.not_valid_promotion unless Validation.valid_total_discount_promotion?(min_price, discount_percentage)

      @min_price = min_price
      @discount_percentage = discount_percentage
    end
  end
end
