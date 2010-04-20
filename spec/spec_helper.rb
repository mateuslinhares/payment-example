# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

require 'spec/autorun'
require 'spec/rails'
require 'remarkable_rails'
require 'rspec_rails_mocha'
require 'machinist'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Remarkable.locale = :en

Webrat.configure do |config|
  config.mode = :rails
end

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  config.mock_with :mocha

  include Webrat::Methods
end
