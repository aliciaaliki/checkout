# frozen_string_literal: true

class Validation
  def self.valid_product?(product_code, name, price)
    [product_code, name].all?(String) && price.is_a?(Numeric)
  end

  def self.valid_multibuy_promotion?(product_code, min_number, price, new_price)
    product_code.is_a?(String) && [min_number, price, new_price].all?(Numeric)
  end

  def self.valid_total_discount_promotion?(min_price, discount_percentage)
    [min_price, discount_percentage].all?(Numeric)
  end

  def self.discounted_new_price?(price, discounted_price)
    discounted_price < price
  end
end
