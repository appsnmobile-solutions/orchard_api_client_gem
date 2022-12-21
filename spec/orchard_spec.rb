# frozen_string_literal: true

require "orchard"
require "byebug"

RSpec.describe Orchard do
  before(:all) do
    params = {
      secret_token: ENV["SECRET_TOKEN"],
      client_token: ENV["CLIENT_TOKEN"],
      url: ENV["ORCHARD_URL"]
    }

    @orchard_api_client = Orchard::ApiClient.new(params)

    randval_one = rand(999).to_s.center(3, rand(9).to_s)
    strtm = Time.new.strftime("%d%H%M%L")
    @transaction_id = strtm + randval_one
  end

  it "Sends a payment request" do
    payment_request_payload = {
      customer_number: "0550000000",
      reference: "test payment",
      amount: "1",
      exttrid: @transaction_id,
      nw: "MTN",
      trans_type: "CTM",
      callback_url: "/",
      ts: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
      client_id: ENV["SERVICE_ID"],
      voucher_code: ""
    }

    request_configurations = {
      timeout: 50
    }

    response = @orchard_api_client.send_payment_request(payment_request_payload, request_configurations)

    expect(response["resp_code"]).to eq("015")
    expect(response["resp_desc"]).to eq("Request successfully received for processing")
  end

  it "Sends an sms" do
    sms_payload = {
      sender_id: "ANM",
      recipient_number: "0557711911",
      msg_body: "Sample text message",
      trans_type: "SMS",
      service_id: ENV["SERVICE_ID"]
    }

    response = @orchard_api_client.send_sms(sms_payload)

    expect(response["resp_code"]).to eq("082")
    expect(response["resp_desc"]).to eq("Message received for delivery")
  end

  it "should check the status of a transaction" do
    transaction_payload = {
      exttrid: @transaction_id,
      service_id: ENV["SERVICE_ID"],
      trans_type: "TSC"
    }

    response = @orchard_api_client.check_transaction_status(transaction_payload)
    expect(response["resp_code"]).to eq("084")
    expect(response["resp_desc"]).to eq("Transaction callback pending")
  end

  it "should check the balance of an account" do
    transaction_payload = {
      service_id: ENV["SERVICE_ID"],
      trans_type: "BLC",
      ts: Time.now.strftime("%Y-%m-%d %H:%M:%S")
    }

    response = @orchard_api_client.check_wallet_balance(transaction_payload)
    expect(response["service_id"]).to eq(1)
  end

  it "should lookup a services information" do
    lookup_payload = {
      service_code: "808"
    }

    @orchard_api_client.service_lookup_request(lookup_payload)
  end

  it "should check customers debit information" do
    debit_information_payload = {
      customer_number: "23355770000000",
      entity_service_id: ENV["SERVICE_ID"],
      auth_code: auth_code
    }

    @orchard_api_client.customer_debit_information(debit_information_payload)
  end

  it "should activate a customers auto debit" do
    customer_activation_payload = {
      customer_number: "23355770000000",
      service_id: ENV["SERVICE_ID"],
      secret_code: "16523",
      nw: "MTN"
    }

    @orchard_api_client.customer_debit_activation(customer_activation_payload)
  end

  it "should deactivate a customers auto debit" do
    customer_deactivation_payload = {
      customer_number: "23355770000000",
      service_id: ENV["SERVICE_ID"],
      subscription_id: subscription_id,
      nw: network
    }

    @orchard_api_client.customer_debit_activation(customer_deactivation_payload)
  end
end
