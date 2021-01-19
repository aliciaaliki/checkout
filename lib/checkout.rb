# frozen_string_literal: true

require_relative 'product'
require_relative 'promotions/total_discount'
require_relative 'promotions/product_multibuy_price'

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

  def empty_basket
    @basket = []
    @sum = 0
  end

  private

  def apply_promotions
    product_multibuy_price_promotions = []
    total_discount_promotions = []

    @promotional_rules.each do |promotion|
      case promotion
      when Promotions::ProductMultibuyPrice
        product_multibuy_price_promotions << promotion
      when Promotions::TotalDiscount
        total_discount_promotions << promotion
      end
    end

    apply_multibuy_discount(product_multibuy_price_promotions)
    apply_total_discount(total_discount_promotions)
  end

  def apply_multibuy_discount(product_multibuy_price_promotions)
    product_multibuy_price_promotions.each do |promotion|
      count = basket.count { |item| item.code == promotion.product_code }
      @sum -= count * (promotion.price - promotion.discounted_price) if count >= promotion.min_number
    end
  end

  def apply_total_discount(total_discount_promotions)
    total_discount_promotions.each do |promotion|
      @sum -= sum * promotion.discount_percentage if sum >= promotion.min_price
    end
  end
end
