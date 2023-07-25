# frozen_string_literal: true

# spec/system/search_component_spec.rb

require 'rails_helper'

RSpec.describe 'SearchComponent' do
  it 'displays search results when a search is performed' do
    car = create(:car)

    visit '/users/sign_up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Phone number', with: '1234567890'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    select car.make, from: 'make'
    select car.model, from: 'model'
    select car.year, from: 'year'

    click_button 'Search'

    expect(page).to have_content("#{car.make} #{car.model} #{car.year}")
  end
end
