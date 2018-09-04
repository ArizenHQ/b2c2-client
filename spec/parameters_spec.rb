require 'spec_helper'

describe 'Parameters' do

  let(:params) {{ }}


  let(:query_parameters) {

  }

  it 'Has the good JSON API query parameters' do
    application = B2C2Client::Application.new(params)

    expect(B2C2Client::Requests::Query.new(application.config).fetch)
      .to eq query_parameters
  end
end
