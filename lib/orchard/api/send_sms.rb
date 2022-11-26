# frozen_string_literal: true

module Orchard
  module API
    class SendSMS < Orchard::API::Base
      def call
        format_recipients_number
        generate_unique_id
        @endpoint = Orchard::API::Constants::SEND_SMS_ENDPOINT
        make_request(:post)
      end

      def format_recipients_number
        recipient_number = @payload[:recipient_number]
        return unless recipient_number

        @payload[:recipient_number] = "233#{recipient_number[-9..]}"
      end

      def generate_unique_id
        @payload[:unique_id] = Time.now.strftime("%y%m%d%L%H%M")
      end
    end
  end
end
