# frozen_string_literal: true

class Product
  attr_accessor :code, :name, :price

  def initialize(code, name, price)
    raise Error.not_valid_product unless Validation.valid_product?(code, name, price)

    @code = code
    @name = name
    @price = price
  end
end
