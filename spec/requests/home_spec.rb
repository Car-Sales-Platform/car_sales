# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes' do
  describe 'GET /index' do
    it 'returns http success' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
      
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
