# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car do
  describe 'validations' do
    subject(:car) { described_class.new }

    before do
      car.make = 'Make1'
      car.model = 'Model1'
      car.year = 2023
    end

    it 'car is not valid without a make' do
      car.make = nil
      expect(car).not_to be_valid
    end

    it 'car is not valid without a model' do
      car.model = nil
      expect(car).not_to be_valid
    end

    it 'car is not valid without a year' do
      car.year = nil
      expect(car).not_to be_valid
    end
  end

  describe 'makes' do
    before do
      described_class.create(make: 'Make1', model: 'Model1', year: 2023)
      described_class.create(make: 'Make1', model: 'Model2', year: 2024)
      described_class.create(make: 'Make2', model: 'Model3', year: 2025)
    end

    it 'returns a list of makes' do
      expect(described_class.makes).to eq(%w[Make1 Make2])
    end
  end
end
