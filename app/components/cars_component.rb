# frozen_string_literal: true

class CarsComponent < ViewComponent::Base
  def initialize(cars:, current_user: nil)
    super
    @cars = cars
    @current_user = current_user
  end

  def render?
    !cars.nil?
  end

  attr_reader :cars, :current_user
end
