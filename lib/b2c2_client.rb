require 'pry'
require 'httparty'

ruby_project_files = Dir[File.join(File.dirname(__FILE__), '**', '*.rb')]

ruby_project_files.sort_by!{ |file_name| file_name.downcase }.each do |path|
  require_relative path
end

$stdout.sync = true

module B2C2Client

  class << self

    attr_reader :application

    def new(opts)
      @application = B2C2Client::Application.new(opts)
    end

    def call
      application.call
    end
  end
end
