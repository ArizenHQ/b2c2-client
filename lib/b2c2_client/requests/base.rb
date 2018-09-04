module B2C2Client
  module Requests
    class Base
      attr_reader :config, :url, :query

      def initialize(config, query)
        @config       = config
        @query        = query

        add_observer(::B2C2Client::Logs.new(config))
      end

      def perform
        fail ::B2C2Client::NotImplemented
      end
    end
  end
end
