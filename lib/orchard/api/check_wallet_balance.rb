# frozen_string_literal: true

module Orchard
  module API
    class CheckWalletBalance < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::CHECK_WALLET_BALANCE
        make_request(:post)
      end
    end
  end
end
