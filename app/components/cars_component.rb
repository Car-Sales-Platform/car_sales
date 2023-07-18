# frozen_string_literal: true

class CarsComponent < ViewComponent::Base
  def initialize(cars:)
    super
    @cars = cars
  end

  attr_reader :cars
end
