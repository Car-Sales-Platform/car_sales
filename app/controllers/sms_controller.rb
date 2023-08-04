# frozen_string_literal: true

class SmsController < ApplicationController
  before_action :authenticate_user!, only: :send_sms

  def send_sms
    send_interest_sms
    flash[:notice] = I18n.t('sms.send_success')
  rescue StandardError
    flash[:alert] = I18n.t('sms.send_error')
  end

  private

  def send_interest_sms
    message_body = generate_message_body
    phone_number = params[:phone_number]
    Twilio::SmsService.new(message_body, phone_number).call
  end

  def generate_message_body
    make = params[:make]
    model = params[:model]
    year = params[:year]
    "Interested in #{make} #{model} (#{year}) from Car Sales Platform"
  end
end
