# frozen_string_literal: true

class Car < ApplicationRecord
  validates :make, :model, :year, presence: true

  scope :makes, -> { distinct.order(:make).pluck(:make) }
  # Ex:- scope :active, -> {where(:active => true)}
end
