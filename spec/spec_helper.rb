$: << 'lib'

require 'rubino'
require 'rack/test'
require 'devtools'
Devtools.init_spec_helper

# require spec support files and shared behavior
Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.extend(LetMockHelper)
end
