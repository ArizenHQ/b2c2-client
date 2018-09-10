require 'spec_helper'

describe 'Configuration' do

  let(:config) { B2C2Client.config }

  let(:default_params) {{ endpoint_url: 'https://b2c2.com' }}

  let(:overriden_params) {{ endpoint_url: 'https://b2c2-overriden.com' }}

  it 'Has default parameters' do
    application = B2C2Client::Application.new({endpoint_url: 'https://b2c2.com'})

    default_params.each do |param|
      expect(application.config.send(param.first)).to eq(param.last)
    end
  end

  it 'can override default parameters' do
    application   = B2C2Client::Application.new(overriden_params)
    overriden_key = overriden_params.keys.first
    default_params.delete(overriden_key)

    default_params.each do |param|
      expect(application.config.send(param.first)).to eq(param.last)
    end

    expect(application.config.send(overriden_key)).to eq(overriden_params[overriden_key])
  end

  it 'has a version number' do
    expect(B2C2Client::VERSION).not_to be nil
  end
end
