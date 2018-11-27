module B2C2Client
  module Requests
    module Post
      class Trade < Base
        attr_accessor :rfq_id, :quantity, :side, :instrument, :price
      end
    end
  end
end
