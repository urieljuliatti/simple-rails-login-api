# frozen_string_literal: true

# Load env variables
require 'dotenv'
Dotenv.load('.env.test')

# Load simplecov
require 'simplecov'
SimpleCov.start 'rails'

require 'webmock/rspec'
WebMock.allow_net_connect!

require 'json_spec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # JSON Spec Config
  config.include JsonSpec::Helpers

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
