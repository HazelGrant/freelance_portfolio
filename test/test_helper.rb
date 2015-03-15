require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'minitest/rails'
require 'minitest/rails/capybara'

class Capybara::Rails::TestCase
  Capybara.javascript_driver = :selenium
end

class ActiveSupport::TestCase
  fixtures :all
end

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_conection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
