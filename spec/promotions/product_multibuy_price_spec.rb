# frozen_string_literal: true

describe 'ProductMultibuyPrice' do
  it 'creates a promotion for product multibuy with code, min_number, price and discounted_price' do
    promotion = Promotions::ProductMultibuyPrice.new('001', 2, 9.25, 8.5)
    expect(promotion.product_code).to eq('001')
    expect(promotion.min_number).to eq(2)
    expect(promotion.price).to eq(9.25)
    expect(promotion.discounted_price).to eq(8.5)
  end
end
