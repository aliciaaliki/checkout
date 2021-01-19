# frozen_string_literal: true

describe 'TotalDiscount' do
  it 'creates a promotion for basket total discount with min_price and discount_percentage' do
    promotion = Promotions::TotalDiscount.new(60, 0.2)
    expect(promotion.min_price).to eq(60)
    expect(promotion.discount_percentage).to eq(0.2)
  end
end
