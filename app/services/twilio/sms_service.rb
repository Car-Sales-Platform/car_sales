# frozen_string_literal: true

# Twilio::SmsService.new('Send from Car Sales Platform', '+254701114636').call
module Twilio
  class SmsService
    TWILIO_ACCOUNT_SID = 'AC21fedbecb157e37da75dc263dd0d7925'
    TWILIO_AUTH_TOKEN = '3414763af96ddfd4057c6eb1d681e28a'
    TWILIO_FROM_PHONE = '+14705929579'
    TWILIO_TO_PHONE = '+254701114636'

    def initialize(body, to_phone_number)
      @body = body
      @to_phone_number = to_phone_number
    end

    def call
      @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

      message = @client.messages
                       .create(
                         body: @body,
                         from: TWILIO_FROM_PHONE,
                         to: to_phone(@to_phone_number)
                       )

      Rails.logger.debug message.sid
    end

    private

    def to_phone(to_phone_number)
      return TWILIO_TO_PHONE if Rails.env.development?

      to_phone_number
    end
  end
end
