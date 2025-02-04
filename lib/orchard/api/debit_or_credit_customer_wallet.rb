module Orchard
  module API
    class DebitOrCreditCustomerWallet < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::DEBIT_OR_CREDIT_CUSTOMER_WALLET_ENDPOINT
        make_request(:post)
      end
    end
  end
end
