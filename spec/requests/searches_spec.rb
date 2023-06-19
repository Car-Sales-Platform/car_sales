# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches' do
  describe 'GET /new' do
    it 'returns http success' do
      get '/searches/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/searches/create'
      expect(response).to have_http_status(:success)
    end
  end
end
