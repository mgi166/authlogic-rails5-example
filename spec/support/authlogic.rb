# See http://www.rubydoc.info/github/binarylogic/authlogic/Authlogic/TestCase
require 'authlogic/test_case'

module AuthlogicHelper
  module Controller
    def login(user)
      activate_authlogic
      UserSession.create(user)
    end
  end
end

RSpec.configure do |config|
  config.include Authlogic::TestCase
  config.include AuthlogicHelper::Controller, type: :controller
end
