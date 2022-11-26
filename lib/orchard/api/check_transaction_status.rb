# frozen_string_literal: true

module Orchard
  module API
    class CheckTransactionStatus < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::CHECK_TRANSACTION_STATUS_ENDPOINT
        make_request(:post)
      end
    end
  end
end
