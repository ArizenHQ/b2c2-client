module B2C2Client

  # Access point for the gem configurations.
  #
  # @return [B2C2Client::Configuration] a configuration instance.
  def self.config
    @config ||= Configuration.new
  end

  # Configure hook used in the gem initializer. Convinient way to set all the
  # gem configurations.
  #
  # example:
  #   B2C2Client.configure do |config|
  #     config.verbose_mode = true
  #   end
  #
  # @return [void]
  def self.configure
    yield config if block_given?
  end

  class Configuration

    attr_accessor :endpoint_url, :api_token

    def set_compulsory_options
      @endpoint_url ||= ENV.fetch('B2C2_ENDPOINT_URL')
      @api_token    ||= ENV.fetch('B2C2_API_TOKEN')
    rescue ::KeyError
      fail MissingEndpointUrl
    end
  end
end
