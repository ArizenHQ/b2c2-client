module B2C2Client
  module Requests
    module Get
      class Base < ::B2C2Client::Requests::Base

        private

        def response
          # TODO : Rescue error
          @response = ::HTTParty.get(url,
                                      headers: {'Authorization': "Token #{config.api_token}"},
                                      body: parameters
                                      )
        end
      end
    end
  end
end
