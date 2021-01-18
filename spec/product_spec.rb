# frozen_string_literal: true

require_relative '../lib/product'

describe 'Product' do
  it 'creates a product with code, name and price' do
    product = Product.new('001', 'name', 9.25)
    expect(product.code).to eq('001')
    expect(product.name).to eq('name')
    expect(product.price).to eq(9.25)
  end
end
