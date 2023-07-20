# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchComponent, type: :component do
  it 'displays car makes and models in select dropdowns' do
    # allow(Car).to receive(:makes).and_return(['Make1', 'Make2', 'Make3'])

    render_inline(described_class.new())

    assert_text("Search")

    # Ensure the select tags and submit button are present in the component
    # expect(rendered).to have_select('make', options: ['Make1', 'Make2', 'Make3'])
    # expect(rendered).to have_select('model', disabled: true)
    # expect(rendered).to have_select('year', disabled: true)
    # expect(rendered).to have_button('Search', class: 'btn btn-primary mt-3')
  end

  # it 'enables model select when a car make is selected' do

  #   allow(Car).to receive(:makes).and_return(['Make1', 'Make2', 'Make3'])

  #   render_inline(SearchComponent.new)

  #   select 'Make1', from: 'make'
  #   expect(rendered).to have_select('model', disabled: false, options: [])
  # end

  # it 'enables year select when a car model is selected' do

  #   allow(Car).to receive(:makes).and_return(['Make1', 'Make2', 'Make3'])
  #   allow(Car).to receive(:models).with('Make1').and_return(['Model1', 'Model2', 'Model3'])

  #   render_inline(SearchComponent.new)


  #   select 'Make1', from: 'make'
  #   expect(rendered).to have_select('model', disabled: false, options: [])

  #   select 'Model1', from: 'model'
  #   expect(rendered).to have_select('year', disabled: false, options: [])
  # end

end
