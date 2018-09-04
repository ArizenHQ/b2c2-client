module B2C2Client
  class Application

    attr_reader :options

    def initialize(options)
      @options = parse_options(options)

      set_options
    end

    def call


      self
    end

    def data
      @data   ||= B2C2Client::Requests::Get.new(config, query).perform
    end

    def query
      @query  ||= B2C2Client::Requests::Query.new(config)
    end

    def config
      @config ||= ::B2C2Client.config.dup
    end
  end
end
