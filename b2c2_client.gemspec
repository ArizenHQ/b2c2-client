# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'b2c2_client/version'

Gem::Specification.new do |spec|
  spec.name                  = 'b2c2_client'
  spec.version               = B2C2Client::VERSION
  spec.authors               = ['sidney']
  spec.email                 = ['sidney.sissaoui@coinhouse.com']
  spec.summary               = 'B2C2Client is a tool to interact with the B2C2 API'
  spec.description           = 'B2C2Client can fetch latest crypto prices using a common interface'
  spec.homepage              = 'https://github.com/ArizenHQ/b2c2_client'
  spec.required_ruby_version = '>= 2'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ['b2c2_client']
  spec.require_paths = ['lib']

  spec.add_dependency 'pry', '~> 0.11.3'
  spec.add_dependency 'httparty', '~> 0.16.2'
  spec.add_dependency 'activesupport', '~> 5.2.0'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 3.4.1'
end
