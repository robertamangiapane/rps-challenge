ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'rps_app.rb')

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'features/web_helpers.rb'
require 'rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
Capybara.app = RPS

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
