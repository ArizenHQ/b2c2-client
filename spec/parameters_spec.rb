require 'spec_helper'

describe 'Parameters' do

  let(:params)            {{ endpoint_url: 'https://b2c2.com', api_token: 'abcd' }}
  let(:application)       { B2C2Client::Application.new(params) }
  let(:config)            { application.config }
  let(:query_parameters)  {
                            {
                              client_rfq_id: SecureRandom.uuid,
                              quantity: 5,
                              side: 'buy',
                              instrument: 'BTCUSD.SPOT'
                            }
                          }

  it 'Has the good JSON API query parameters' do
    expect(B2C2Client::Requests::Post::RequestForQuote.new(config, query_parameters).parameters)
      .to eq(query_parameters)
  end
end
