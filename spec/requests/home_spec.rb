# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes' do
  describe 'GET /index' do
    let(:user) do
      User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.com',
        phone_number: '1234567890',
        password: 'password'
      )
    end

    before do
      # user.skip_confirmation!
      user.save
    end

    def authenticate_user(user)
      post new_user_session_path, params: { user: { email: user.email, password: user.password } }
      follow_redirect!
    end

    it 'returns http success' do
      authenticate_user(user)
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
