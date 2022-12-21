# frozen_string_literal: true

module Orchard
  module API
    class CustomerDebitDeactivation < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::CUSTOMER_DEBIT_DEACTIVATION_ENDPOINT
        make_request(:post)
      end
    end
  end
end
