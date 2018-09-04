module B2C2Client
  class Exception < StandardError; end
  class NotImplemented < StandardError; end
  class TooManyRedirects < StandardError; end
  class MissingArgumentError < StandardError; end
  class MissingEndpointUrl < StandardError; end
end
