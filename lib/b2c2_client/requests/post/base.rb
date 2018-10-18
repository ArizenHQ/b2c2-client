module B2C2Client
  module Requests
    module Post
      class Base
        attr_reader :config

        def initialize(config, options = {})
          @config = config

          set_options(options)
        end

        def parameters
          {}.tap do |hash|
            (instance_variables - [:@config]).each do |ivar|
              hash[ivar.to_s[1..-1].to_sym] = instance_variable_get(ivar)
            end
          end
        end

        def perform
          parsed_response
        end

        # Gets the path of the current called method
        #
        # Returns [String] the current full endpoint path
        def url
          config.endpoint_url + '/' + self.class.name.demodulize.underscore + '/'
        end

        private

        def set_options(options)
          options.each do |parameter, value|
            self.send("#{parameter}=", value)
          end
        end

        def response
          # TODO : Rescue error
          @response = ::HTTParty.post(url,
                                      headers: {'Authorization': "Token #{config.api_token}"},
                                      body: parameters
                                      )
        end

        def parsed_response
          JSON.parse(response.body)
        end
      end
    end
  end
end
