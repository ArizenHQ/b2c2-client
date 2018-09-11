module B2C2Client
  module Requests
    class Private
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def request_for_quote(params)
        Post::RequestForQuote.new(self.config, params)
      end
    end
  end
end
