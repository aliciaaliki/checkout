require_relative '../lib/checkout'
require_relative '../lib/product'
require_relative '../lib/promotions/total_discount'
require_relative '../lib/promotions/product_multibuy_price'


RSpec.describe Checkout do
  promotions = [
    Promotions::ProductMultibuyPrice.new("001", 2, 9.25, 8.5),
    Promotions::TotalDiscount.new(60, 0.10)
  ]
  let(:co){ Checkout.new(promotions) }
  let(:basket){ co.basket }

  let(:lavender_heart) { Product.new("001", "Lavender heart", 9.25) }
  let(:personalised_cufflinks) { Product.new("002", "Personalised cufflinks", 45) }
  let(:kids_t_shirt) { Product.new("003", "Kids T-shirt", 19.95) }

  it 'scans a new item' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    expect(basket.size).to eq(2)
  end


  it 'calculates the total of basket with over £60 promotion' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    co.scan(kids_t_shirt)
    expect(co.total).to eq(66.78)
  end

  it 'calculates the total of basket with discounted price for multibuys of a product' do
    co.scan(lavender_heart)
    co.scan(kids_t_shirt)
    co.scan(lavender_heart)
    expect(co.total).to eq(36.95)
  end

  it 'calculates the total of basket with discounted price for multibuys of a product and with over £60 promotion' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    co.scan(lavender_heart)
    co.scan(kids_t_shirt)
    expect(co.total).to eq(73.76)
  end
end
