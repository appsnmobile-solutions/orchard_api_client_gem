# frozen_string_literal: true

module Orchard
  class ApiClient
    def initialize(params)
      @secret_token = params[:secret_token]
      @client_token = params[:client_token]
      @url = params[:url]
      create_connection
    end

    def send_payment_request(payload, request_configurations = {})
      Orchard::API::SendPaymentRequest.call(payload_with_client_data(payload), request_configurations)
    end

    def send_sms(payload, request_configurations = {})
      Orchard::API::SendSMS.call(payload_with_client_data(payload), request_configurations)
    end

    def service_lookup_request(payload, request_configurations = {})
      Orchard::API::ServiceLookupRequest.call(payload_with_client_data(payload), request_configurations)
    end

    def check_transaction_status(payload, request_configurations = {})
      Orchard::API::CheckTransactionStatus.call(payload_with_client_data(payload), request_configurations)
    end

    def check_wallet_balance(payload, request_configurations = {})
      Orchard::API::CheckWalletBalance.call(payload_with_client_data(payload), request_configurations)
    end

    def customer_debit_information(payload, request_configurations = {})
      Orchard::API::CustomerDebitInformation.call(payload_with_client_data(payload), request_configurations)
    end

    def customer_debit_activation(payload, request_configurations = {})
      Orchard::API::CustomerDebitActivation.call(payload_with_client_data(payload), request_configurations)
    end

    def customer_debit_deactivation(payload, request_configurations = {})
      Orchard::API::CustomerDebitDeactivation.call(payload_with_client_data(payload), request_configurations)
    end

    def debit_or_credit_customer_wallet(payload, request_configurations = {})
      Orchard::API::DebitOrCreditCustomerWallet.call(payload_with_client_data(payload), request_configurations)
    end

    def send_third_party_request(payload, request_configurations = {})
      Orchard::API::SendThirdPartyRequest.call(payload_with_client_data(payload), request_configurations)
    end

    private

    def create_connection
      @connection = Faraday.new(
        url: @url.to_s,
        headers: {
          "Content-Type" => "application/json"
        }
      )
    end

    def payload_with_client_data(payload)
      {
        payload: payload,
        secret_token: @secret_token,
        client_token: @client_token,
        connection: @connection
      }
    end
  end
end
