require 'spec_helper'

describe 'Parameters' do

  let(:params)                        {{ endpoint_url: 'https://b2c2.com', api_token: 'abcd' }}
  let(:application)                   { B2C2Client::Application.new(params) }
  let(:config)                        { application.config }
  let(:empty_parameters)              {{}}
  let(:request_for_quote_parameters)  {
                                        {
                                          client_rfq_id: SecureRandom.uuid,
                                          quantity: 5,
                                          side: 'buy',
                                          instrument: 'BTCUSD.SPOT'
                                        }
                                      }
  let(:trade_parameters)              {
                                        {
                                          rfq_id: SecureRandom.uuid,
                                          quantity: 5,
                                          side: 'buy',
                                          instrument: 'BTCUSD.SPOT',
                                          price: '3999.99000000'
                                        }
                                      }

  it 'Has the good JSON API request for quote query parameters' do
    expect(B2C2Client::Requests::Post::RequestForQuote.new(config, request_for_quote_parameters).parameters)
      .to eq(request_for_quote_parameters)
  end

  it 'Has the good JSON API balance query parameters' do
    expect(B2C2Client::Requests::Get::Balance.new(config, empty_parameters).parameters)
      .to eq(empty_parameters)
  end

  it 'Has the good JSON API instruments query parameters' do
    expect(B2C2Client::Requests::Get::Instruments.new(config, empty_parameters).parameters)
      .to eq(empty_parameters)
  end

  it 'Has the good JSON API trade query parameters' do
    expect(B2C2Client::Requests::Post::Trade.new(config, trade_parameters).parameters)
      .to eq(trade_parameters)
  end
end
