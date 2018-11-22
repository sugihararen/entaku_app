module SpecTestHelper
    def add_session(arg)
      arg.each { |k, v| session[k] = v }
    end
  end
  
  RSpec.configure do |config|
    config.include SpecTestHelper, type: :controller
  end

  