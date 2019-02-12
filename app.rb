require 'sinatra'
require 'dotenv/load'
require 'rest-client'
require 'json'

Dir["./app/**/*.rb"].each {|file| require file }
Dir["./app/services/**/*.rb"].each {|file| require file }

class App < Sinatra::Base
  get '/' do
    'Hello world!'
  end

  post '/webhook' do
    request.body.rewind
    result = JSON.parse(request.body.read)["queryResult"]

    # response = result['parameters'].nil?
    if result["action"] == 'help'
      response = InterpretService.call(result['action'], {})
    else
      response = InterpretService.call(result['action'], result['parameters'])
    end

    content_type :json, charset: 'utf-8'
    {
      "payload": {
        "telegram": {
          "text": response,
          "parse_mode": "Markdown"
        }
      }
    }.to_json
  end
end
