require_relative '../lib/checkout'
require_relative '../lib/promotions/total_discount'

RSpec.describe Checkout do
  promotions = [Promotions::TotalDiscount.new(60, 0.10)]
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
end
