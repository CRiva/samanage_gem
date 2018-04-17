require "bundler/setup"
require "samanage"
require "vcr"

RSpec.configure do |config|

  Samanage.configure do |conf|
	conf.uri = "https://api.samanage.com/incidents.json"
	conf.jwt = ""
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  VCR.configure do |config|
	config.cassette_library_dir = "fixtures/vcr_cassettes"
	config.hook_into :webmock
  end

end