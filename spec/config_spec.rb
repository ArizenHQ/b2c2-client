require 'spec_helper'

describe 'Configuration' do

  let(:config) { B2C2Client.config }

  let(:default_params) {{ endpoint_url: 'https://sandbox.b2c2.net', api_token: 'abcd' }}

  it 'Passes correct parameters' do
    application = B2C2Client::Application.new(default_params)

    default_params.each do |param|
      expect(application.config.send(param.first)).to eq(param.last)
    end
  end

  it 'has a version number' do
    expect(B2C2Client::VERSION).not_to be nil
  end
end
