$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'b2c2_client'
require 'webmock/rspec'
require 'fileutils'

RSpec.configure do |config|
  config.before(:each) do

    stub_request(:get,  "").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
        }).
          to_return(status: 200, body: File.read(''), headers: {})


  end
end
