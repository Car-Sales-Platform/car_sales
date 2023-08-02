# frozen_string_literal: true

# spec/factories/search_form.rb

FactoryBot.define do
  factory :car do
    make { 'Honda' }
    model { 'Civic' }
    year { '2017' }
  end
end
