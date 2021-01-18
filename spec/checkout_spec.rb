require_relative '../lib/checkout'

RSpec.describe Checkout do
  let(:co){ Checkout.new }
  let(:basket){ co.basket }
  
  let(:lavender_heart) { Product.new("001", "Lavender heart", 9.25) }
  let(:personalised_cufflinks) { Product.new("002", "Personalised cufflinks", 45) }
  let(:kids_t_shirt) { Product.new("003", "Kids T-shirt", 19.95) }

  it 'scans a new item' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    expect(basket.size).to eq(2)
  end

  it 'calculates the total of basket without promotions' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    co.scan(kids_t_shirts)
    expect(co.total).to eq(74.2)
  end
end
