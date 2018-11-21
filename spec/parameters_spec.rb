require 'spec_helper'

describe 'Parameters' do

  let(:params)                        {{ endpoint_url: 'https://b2c2.com', api_token: 'abcd' }}
  let(:application)                   { B2C2Client::Application.new(params) }
  let(:config)                        { application.config }
  let(:request_for_quote_parameters)  {
                                        {
                                          client_rfq_id: SecureRandom.uuid,
                                          quantity: 5,
                                          side: 'buy',
                                          instrument: 'BTCUSD.SPOT'
                                        }
                                      }
  let(:balance_parameters)            { {} }

  it 'Has the good JSON API request for quote query parameters' do
    expect(B2C2Client::Requests::Post::RequestForQuote.new(config, request_for_quote_parameters).parameters)
      .to eq(request_for_quote_parameters)
  end

  it 'Has the good JSON API balance query parameters' do
    expect(B2C2Client::Requests::Post::Balance.new(config, balance_parameters).parameters)
      .to eq(balance_parameters)
  end
end
