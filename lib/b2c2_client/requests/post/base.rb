module B2C2Client
  module Requests
    module Post
      class Base

        def initialize(options = {})
          set_options(options)
        end

        def fetch
          {}.tap do |hash|
            instance_variables.each do |ivar|
              hash[ivar.to_s[1..-1].to_sym] = instance_variable_get(ivar)
            end
          end
        end

        private

        def set_options(options)
          options.each do |parameter, value|
            self.send("#{parameter}=", value)
          end
        end
      end
    end
  end
end
