module B2C2Client
  module Requests
    class Private
      attr_reader :config

      def initialize(config)
        @config = config

        initialize_endpoints_methods
      end

      private

      # Listing every endpoints being in the post folder
      #
      # Returns array [Array], an array listing the endpoints
      def possible_post_endpoints
        Dir[File.join(File.dirname(__FILE__), '**', 'post/*.rb')]
          .map{|file| file.split('/').last[0..-4]}
          .reject{|file| file == 'base'}
      end

      # Listing every endpoints being in the get folder
      #
      # Returns array [Array], an array listing the endpoints
      def possible_get_endpoints
        Dir[File.join(File.dirname(__FILE__), '**', 'get/*.rb')]
          .map{|file| file.split('/').last[0..-4]}
          .reject{|file| file == 'base'}
      end

      # For each endpoint paths, define one method to call it
      #
      # Returns array [Array], an array listing the methods
      def initialize_endpoints_methods
        possible_post_endpoints.each do |endpoint_path|
          self.class.send(:define_method, endpoint_path) do |params|
            "B2C2Client::Requests::Post::#{endpoint_path.camelize}"
              .constantize.new(self.config, params)
          end
        end

        possible_get_endpoints.each do |endpoint_path|
          self.class.send(:define_method, endpoint_path) do |params|
            "B2C2Client::Requests::Get::#{endpoint_path.camelize}"
              .constantize.new(self.config, params)
          end
        end
      end
    end
  end
end
