# frozen_string_literal: true

class SearchComponent < ViewComponent::Base
  def car_make_array
    Car.makes
  end
end
