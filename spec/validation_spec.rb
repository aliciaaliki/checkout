# frozen_string_literal: true

RSpec.describe Validation do
  describe '#valid_product?' do
    it 'returns true when inputs are valid' do
      expect(Validation.valid_product?('001', 'Lavender heart', 9.25)).to be true
    end

    it 'returns false when inputs are invalid' do
      expect(Validation.valid_product?('001', 45, 'sdf')).to be false
    end

    it 'returns false when inputs are empty' do
      expect(Validation.valid_product?('', 7, '')).to be false
    end
  end

  describe '#valid_multibuy_promotion?' do
    it 'returns true when product inputs are valid' do
      expect(Validation.valid_multibuy_promotion?('001', 2, 9.25, 8)).to be true
    end

    it 'returns false when product inputs are invalid' do
      expect(Validation.valid_multibuy_promotion?('001', 45, 'sdf', 8)).to be false
    end

    it 'returns false when inputs are empty' do
      expect(Validation.valid_multibuy_promotion?('', 45, '', 8)).to be false
    end
  end

  describe '#valid_total_discount_promotion?' do
    it 'returns true when product inputs are valid' do
      expect(Validation.valid_total_discount_promotion?(60, 0.1)).to be true
    end

    it 'returns false when product inputs are invalid' do
      expect(Validation.valid_total_discount_promotion?('60', 45)).to be false
    end

    it 'returns false when inputs are empty' do
      expect(Validation.valid_total_discount_promotion?('', 8)).to be false
    end
  end

  describe '#discounted_new_price?' do
    it 'returns true when product inputs are valid' do
      expect(Validation.discounted_new_price?(8.5, 9.25)).to be false
    end

    it 'returns false when product inputs are invalid' do
      expect(Validation.discounted_new_price?(9.25, 8)).to be true
    end

    it 'returns false when inputs are empty' do
      expect(Validation.discounted_new_price?('', '')).to be false
    end
  end

  describe '#positive_min_number?' do
    it 'returns true when min_number is over 0' do
      expect(Validation.positive_min_number?(1)).to be true
    end

    it 'returns false when min_number is 0' do
      expect(Validation.positive_min_number?(0)).to be false
    end
  end
end
