# frozen_string_literal: true

class CarsComponent < ViewComponent::Base
  def initialize(cars:)
    super
    @cars = cars
  end

  def render?
    !cars.nil?
  end

  attr_reader :cars
end
