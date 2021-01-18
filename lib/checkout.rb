# require "checkout/version"

class Checkout
  attr_accessor :basket, :sum

  def initialize
    @basket = []
    @sum = 0
  end

  def scan(item)
    basket << item
  end
end
