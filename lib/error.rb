# frozen_string_literal: true

class Error < StandardError
  def self.not_valid_product
    new 'Invalid product, please try again'
  end

  def self.not_valid_promotion
    new 'Invalid promotion, please try again'
  end

  def self.not_valid_discount
    new 'Discounted price is not less than original price of product'
  end
end
