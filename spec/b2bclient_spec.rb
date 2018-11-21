require 'spec_helper'

describe 'B2C2Client' do

  context 'Post' do

    context 'Request for Quote' do

      let(:query_parameters)  {{
                                client_rfq_id: 'd779f888-d2e6-499c-92f1-d62c4c85f81b',
                                quantity: 5,
                                side: 'buy',
                                instrument: 'BTCUSD.SPOT'
                              }}

      let(:response) {
        {"valid_until"=>"2017-01-01T19:45:22.025464Z", "rfq_id"=>"d4e41399-e7a1-4576-9b46-349420040e1a", "client_rfq_id"=>"149dc3e7-4e30-4e1a-bb9c-9c30bd8f5ec7", "quantity"=>"1.0000000000", "side"=>"buy", "instrument"=>"BTCUSD.SPOT", "price"=>"700.00000000", "created"=>"2018-02-06T16:07:50.122206Z"}
      }

      it 'Has the good JSON query parameters' do
        expect(@private_client.request_for_quote(query_parameters).parameters).to eq(query_parameters)
      end

      it 'Returns the good JSON response' do
        expect(@private_client.request_for_quote(query_parameters).perform).to eq(response)
      end
    end

    context 'Request for Balance' do

      let(:query_parameters)  {{}}

      let(:response) {
        {"USD"=>"0", "BTC"=>"0", "JPY"=>"0", "GBP"=>"0", "ETH"=>"0", "EUR"=>"0", "CAD"=>"0", "LTC"=>"0", "XRP"=>"0", "BCH"=>"0"}
      }

      it 'Has the good JSON query parameters' do
        expect(@private_client.balance(query_parameters).parameters).to eq(query_parameters)
      end

      it 'Returns the good JSON response' do
        expect(@private_client.balance(query_parameters).perform).to eq(response)
      end
    end
  end
end
