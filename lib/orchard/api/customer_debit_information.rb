# frozen_string_literal: true

module Orchard
  module API
    class CustomerDebitInformation < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::CUSTOMER_DEBIT_INFORMATION_ENDPOINT
        make_request(:get)
      end
    end
  end
end
