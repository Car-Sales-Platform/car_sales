# frozen_string_literal: true

class Car < ApplicationRecord
  validates :make, :model, :year, presence: true

  def self.makes
    Car.distinct.pluck(:make)
  end
end
