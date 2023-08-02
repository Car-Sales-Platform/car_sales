# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsComponent, type: :component do
  describe 'Search results' do
    it 'does not render anything when cars are nil' do
      car_component = render_inline(described_class.new(cars: nil))

      expect(car_component.text).to be_empty
    end

    it 'renders new car component with car make, model and year' do
      car1 = Car.create(make: 'Make1', model: 'Model1', year: 2023)
      cars = [car1]

      car_component = render_inline(described_class.new(cars: cars))

      expect(car_component).to have_text('Make1')
      expect(car_component).to have_text('Model1')
      expect(car_component).to have_text('2023')
    end
  end
end
