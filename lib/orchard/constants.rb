# frozen_string_literal: true

module Orchard
  module API
    module Constants
      SEND_PAYMENT_REQUEST_ENDPOINT = "/sendRequest"
      SERVICE_LOOKUP_REQUEST_ENDPOINT = "/sendRequest"
      DEBIT_OR_CREDIT_CUSTOMER_WALLET_ENDPOINT = "/sendRequest"
      SEND_SMS_ENDPOINT = "/sendSms"
      # SERVICE_LOOKUP_REQUEST_ENDPOINT = "/get_service_lookup_req"

      CHECK_TRANSACTION_STATUS_ENDPOINT = "/checkTransaction"
      CHECK_WALLET_BALANCE = "/check_wallet_balance"
      # CHECK_WALLET_BALANCE = "/portal_wallet_bal_req"
      CUSTOMER_DEBIT_INFORMATION_ENDPOINT = "/get_cust_recur_debit_info"
      CUSTOMER_DEBIT_ACTIVATION_ENDPOINT = "/cust_recur_debit_activation"
      CUSTOMER_DEBIT_DEACTIVATION_ENDPOINT = "/cancel_cust_auto_debit_subscrip"
      THIRD_PARTY_REQUEST = "/third_party_request"
    end
  end
end
