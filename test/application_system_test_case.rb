# frozen_string_literal: true

# To sign in users in system tests, we will rely on helpers from the Warden gem
# to avoid coding them ourselves. Devise is built on top of Warden and the
# Warden::Test::Helpers module contains helpers that will help us login users
# in our tests thanks to the login_as method.

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
