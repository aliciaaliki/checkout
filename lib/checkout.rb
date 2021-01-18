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

  def total
    basket.each do |item|
      @sum += item.price
    end
    sum.round(2)
  end
end
