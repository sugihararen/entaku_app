# frozen_string_literal: true

module SpecTestHelper
  def add_session(arg)
    arg.each { |k, v| session[k] = v }
  end
  RSpec.configure do |config|
    config.include SpecTestHelper, type: :controller
  end
end
