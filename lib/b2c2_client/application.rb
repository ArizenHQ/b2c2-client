module B2C2Client
  class Application

    def initialize(options)
      set_options(options)
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

    private

    def set_options(options)
      options.each { |k, v| config.send("#{k}=", v) }
      config.set_compulsory_options
    end
  end
end
