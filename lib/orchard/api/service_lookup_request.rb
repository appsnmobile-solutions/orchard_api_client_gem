# frozen_string_literal: true

module Orchard
  module API
    class ServiceLookupRequest < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::SERVICE_LOOKUP_REQUEST_ENDPOINT
        make_request(:get)
      end
    end
  end
end
