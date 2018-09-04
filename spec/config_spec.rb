require 'spec_helper'

describe 'Configuration' do

  let(:config) { B2C2Client.config }

  let(:params) {{ }}

  let(:other_params)  {{ }}

  let(:default_params) {{ }}

  let(:overriden_params) {{  }}

  it 'Has default parameters' do
    application = B2C2Client::Application.new({})

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
