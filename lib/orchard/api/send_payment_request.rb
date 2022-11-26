# frozen_string_literal: true

module Orchard
  module API
    class SendPaymentRequest < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::SEND_PAYMENT_REQUEST_ENDPOINT
        make_request(:post)
      end
    end
  end
end
