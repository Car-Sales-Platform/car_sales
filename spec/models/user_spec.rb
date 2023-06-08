# frozen_string_literal: true

require 'rails_helper'

RSpec.describe described_class, type: :model do
  describe 'validations' do
    it 'requires phone number, first name, and last name' do
      described_class = described_class.new
      expect(described_class).not_to be_valid
      expect(described_class.errors[:phone_number]).to include("can't be blank")
      expect(described_class.errors[:first_name]).to include("can't be blank")
      expect(described_class.errors[:last_name]).to include("can't be blank")
    end
  end

  describe 'devise modules' do
    it 'includes database_authenticatable' do
      expect(described_class.devise_modules).to include(:database_authenticatable)
    end

    it 'includes registerable' do
      expect(described_class.devise_modules).to include(:registerable)
    end

    it 'includes recoverable' do
      expect(described_class.devise_modules).to include(:recoverable)
    end

    it 'includes rememberable' do
      expect(described_class.devise_modules).to include(:rememberable)
    end

    it 'includes validatable' do
      expect(described_class.devise_modules).to include(:validatable)
    end
  end
end
