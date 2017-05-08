require 'pry'

Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
