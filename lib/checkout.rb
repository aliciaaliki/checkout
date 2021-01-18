class Checkout
  attr_accessor :basket, :sum

  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
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
    apply_promotions
    sum.round(2)
  end

  private

  def apply_promotions
    @promotional_rules.each do |promotion|
      @sum -= promotion.apply(basket, sum)
    end
  end
end
