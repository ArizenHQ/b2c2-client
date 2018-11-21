module B2C2Client
  module Requests
    module Post
      class Trade < Base
        attr_accessor :client_rfq_id, :quantity, :side, :instrument, :price
      end
    end
  end
end
