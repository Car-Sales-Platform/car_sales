# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires phone number, first name, and last name' do
      user = User.new
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
      expect(user.errors[:last_name]).to include("can't be blank")
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

  describe 'testing phone number' do
    subject { User.new(email: 'johndoe@gmail.com', first_name: 'john', last_name: 'doe', phone_number: '0712345678', password: 'jumbledchars') }
    it 'checks length of the phone number' do
      subject.phone_number = 'invalid'
      expect(subject).to_not be_valid
      expect(subject.errors[:phone_number]).to include("is not a number", "is too short (minimum is 10 characters)")
    end
  end
end
