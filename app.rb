require 'sinatra'
require 'dotenv/load'


class App < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
