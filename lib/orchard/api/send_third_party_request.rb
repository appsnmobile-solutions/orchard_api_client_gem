# frozen_string_literal: true

module Orchard
  module API
    class SendThirdPartyRequest < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::THIRD_PARTY_REQUEST
        make_request(:post)
      end
    end
  end
end
