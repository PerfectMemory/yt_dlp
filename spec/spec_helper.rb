# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(__dir__, '../lib'))

require 'rspec/its'
require 'simplecov'
require 'simplecov-lcov'

# Require all support files
Dir.glob(File.join(__dir__, 'support', '*.rb')).sort.each do |f|
  require f
end

SimpleCov::Formatter::LcovFormatter.config do |c|
  c.report_with_single_file = true
  c.single_report_path = 'coverage/lcov.info'
end

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::LcovFormatter
  ]
)

SimpleCov.start do
  add_filter ENV['GEM_HOME'] if ENV.fetch('GEM_HOME', '').include?('bundle')
  add_filter '.bundle'
  add_filter 'spec/support'
  add_group 'Library', 'lib'
  add_group 'Specs', 'spec'
end

require 'yt_dlp'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.formatter = :documentation
  config.order = :rand

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end

  config.include Helpers
end
