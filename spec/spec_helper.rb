$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'b2c2_client'
require 'webmock/rspec'
require 'fileutils'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post,  "https://sandboxapi.b2c2.net/request_for_quote/").
      with(
        headers: {
          'client_rfq_id'=>SecureRandom.uuid,
          'quantity'=>5,
          'side'=>'buy',
          'instrument'=>'BTCUSD.SPOT'
        }).
          to_return(status: 200, body:
            '{"valid_until": "2017-01-01T19:45:22.025464Z",
              "rfq_id": "d4e41399-e7a1-4576-9b46-349420040e1a",
              "client_rfq_id": "149dc3e7-4e30-4e1a-bb9c-9c30bd8f5ec7",
              "quantity": "1.0000000000",
              "side": "buy",
              "instrument": "BTCUSD.SPOT",
              "price": "700.00000000",
              "created": "2018-02-06T16:07:50.122206Z"}', headers: {})
  end
end
