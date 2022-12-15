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
      client_id: ENV["CLIENT_ID"],
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
      recipient_number: "0550000000",
      msg_body: "Sample text message",
      trans_type: "SMS",
      service_id: ENV["CLIENT_ID"]
    }

    response = @orchard_api_client.send_sms(sms_payload)

    expect(response["resp_code"]).to eq("082")
    expect(response["resp_desc"]).to eq("Message received for delivery")
  end

  it "should check the status of a transaction" do
    transaction_payload = {
      exttrid: @transaction_id,
      service_id: ENV["CLIENT_ID"],
      trans_type: "TSC"
    }

    @orchard_api_client.check_transaction_status(transaction_payload)
  end

  it "should check the balance of an account" do
    transaction_payload = {
      service_id: ENV["CLIENT_ID"],
      trans_type: "BLC",
      ts: Time.now.strftime("%Y-%m-%d %H:%M:%S")
    }

    @orchard_api_client.check_wallet_balance(transaction_payload)
  end
end
