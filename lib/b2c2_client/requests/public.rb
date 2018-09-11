module B2C2Client
  module Requests
    class Public
      attr_reader :response

      def perform
        parsed_response
      end

      private

      def fetch_data
        # TODO : Rescue error
        @response = ::HTTParty.get(url, query: query.fetch)
      end

      def parsed_response
        JSON.parse(response.body)
      end
    end
  end
end
