module Orchard
  module API
    class ResendCallback < Orchard::API::Base
      def call
        @endpoint = Orchard::API::Constants::RESEND_CALLBACK_ENDPOINT
        make_request(:post)
      end
    end
  end
end
