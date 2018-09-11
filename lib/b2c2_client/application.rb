module B2C2Client
  class Application

    def initialize(options)
      set_options(options)
    end

    def public
      @post   ||= B2C2Client::Requests::Public.new(config)
    end

    def private
      @post   ||= B2C2Client::Requests::Private.new(config)
    end

    def config
      @config ||= ::B2C2Client.config.dup
    end

    private

    def set_options(options)
      options.each { |key, value| config.send("#{key}=", value) }
      config.set_compulsory_options
    end
  end
end
