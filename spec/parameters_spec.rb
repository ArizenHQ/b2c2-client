require 'spec_helper'

describe 'Parameters' do

  let(:params)            {{ endpoint_url: 'https://b2c2.com' }}
  let(:application)       { B2C2Client::Application.new(params) }
  let(:query_parameters)  {
                            { client_rfq_id: SecureRandom.uuid,
                              quantity: 5,
                              side: 'buy',
                              instrument: 'BTCUSD.SPOT' }
                          }

  it 'Has the good JSON API query parameters' do
    expect(B2C2Client::Requests::Post::RequestForQuote.new(query_parameters).fetch).to eq(query_parameters)
  end
end
