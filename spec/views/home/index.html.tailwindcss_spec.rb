# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do
  context 'when user is not signed in' do
    before do
      allow(view).to receive(:user_signed_in?).and_return(false)
      render
    end

    it 'does not render the sign-out button' do
      expect(rendered).not_to have_css('.btn.btn-neutral.rounded[value="Sign out"]')
    end

    it 'renders the sign-in button with the "btn" and "btn-neutral" classes' do
      expect(rendered).to have_css('.btn.btn-neutral.rounded')
    end

  end
end

