module B2C2Client
  module Requests
    module Post
      class Base < ::B2C2Client::Requests::Base

        private

        def response
          # TODO : Rescue error
          @response = ::HTTParty.post(url,
                                      headers: {'Authorization': "Token #{config.api_token}"},
                                      body: parameters
                                      )
        end
      end
    end
  end
end
