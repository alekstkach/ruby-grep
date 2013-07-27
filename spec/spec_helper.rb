require 'rubygems'
require 'bundler/setup'

require 'ruby-grep' # and any other gems you need
require File.expand_path(File.join(File.dirname(__FILE__), 'test_data'))

RSpec.configure do |config|
  config.after(:suite) do
    `rm -rf #{TEMP_DIRECTORY_SPEC_TEST_PATH}`
  end
end