module B2C2Client
  module Requests
    module Post
      class RequestForQuote < Base
        attr_accessor :config, :client_rfq_id, :quantity, :side, :instrument

      end
    end
  end
end
