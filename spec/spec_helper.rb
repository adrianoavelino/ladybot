require "rspec"
require "rack/test"
require_relative '../app.rb'
require 'rest-client'
require 'json'

Dir["./app/**/*.rb"].each {|file| require file }
Dir["./app/services/**/*.rb"].each {|file| require file }

set :enviroment, :test

module RSpecMixin
  include Rack::Test::Methods

  def app
    App
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end
