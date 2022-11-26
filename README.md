# Orchard API Client
This api client integrates into appsNmobiles orchard payment solution

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add orchard-api-client-anm

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install orchard-api-client-anm

## Usage
```ruby
#load the gem class
  require 'orchard'
    
#Create a client object with the secret token, client token, and the url
  params = {
    secret_token: ENV['SECRET_TOKEN'],
    client_token: ENV['CLIENT_TOKEN'],
    url: ENV['ORCHARD_URL']
  }
  
  client = Orchard::ApiClient.new(params)
 
#Use client object for various api functions

#optional configuration configurations
  request_configurations = {
    timeout: 30
  }

#Send payment request
    
  randval_one = rand(999).to_s.center(3, rand(9).to_s)
  strtm = Time.new.strftime("%d%H%M%L")
  processing_id = strtm + randval_one
  trans_type = allowed_parameters['CTM(client to merchant)' / 'MTC(merchant to client)']
  nw = allowed_parameters['MTN','VOD','AIR']
  
  payment_request_payload = {
    customer_number: '0550000000',
    reference: 'AppsNmobile Pay',
    amount: '1',
    exttrid: processing_id,
    nw: 'MTN',
    trans_type: 'CTM',
    callback_url: '/',
    ts: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
    client_id: ENV['SERVICE_ID'],
    voucher_code: ''
  }
 
  response = client.send_payment_request(payment_request_payload, request_configurations)

#Send Sms
  sms_payload = {
    sender_id: 'ANM',
    recipient_number: '0550000000',
    msg_body: 'Sample text message',
    trans_type: 'SMS',
    service_id: ENV['SERVICE_ID']
  }

  response = client.send_sms(sms_payload)
```
