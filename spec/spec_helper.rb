# frozen_string_literal: true

require "tenet"
require "webrick"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    Thread.start do
      WEBrick::HTTPServer.new(
        DocumentRoot: File.join(__dir__, "fixtures/sample_site"),
        Port: 8000
      ).tap { |server|
        Signal.trap(:INT) { server.shutdown }
        server.start
      }
    end
  end
end
