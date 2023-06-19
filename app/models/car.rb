# frozen_string_literal: true

class Car < ApplicationRecord
  validates :make, :model, :year, presence: true
end
