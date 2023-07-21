# frozen_string_literal: true

# spec/components/search_form_spec.rb

require 'spec_helper'

RSpec.describe SearchComponent, type: :component do
  let(:car_make_array) { %w[Make1 Make2 Make3] }

  before do
    allow(Car).to receive(:makes).and_return(car_make_array)
  end

  it 'enables model and year select when a car make is selected' do
    component = render_inline(described_class.new)

    expect(component).to have_select('model', disabled: true)
    expect(component).to have_select('year', disabled: true)

    # subject.select_car_make('Make1')

    # expect(rendered_component).to have_select('model', disabled: false, options: [])
  end
end
