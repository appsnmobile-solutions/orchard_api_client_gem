# frozen_string_literal: true

module Orchard
  module API
    class Base
      def initialize(params, request_configurations)
        @payload = params[:payload]
        @client_token = params[:client_token]
        @secret_token = params[:secret_token]
        @connection = params[:connection]
        @timeout = request_configurations[:timeout] || 30
      end

      def self.call(params, request_configurations)
        new(params, request_configurations).call
      end

      def compute_signature
        digest = OpenSSL::Digest.new("sha256")
        OpenSSL::HMAC.hexdigest(digest, @secret_token.to_s, @payload.to_json)
      end

      def make_request(method)
        @response = @connection.send(method) do |request|
          request.url @endpoint
          request.options.timeout = @timeout
          request["Authorization"] = "#{@client_token}:#{compute_signature}"
          if method.eql?(:get)
            request.params = @payload
          else
            request.body = @payload.to_json
          end
        end

        JSON.parse(@response.body)
      rescue StandardError => e
        error_response(e)
      end

      def error_response(error)
        {
          "res_code" => "999",
          "res_desc" => @response.reason_phrase,
          "error_message" => error.message,
          "error_class" => error.class
        }
      end
    end
  end
end
