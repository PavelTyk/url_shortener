require 'sinatra'
require 'json'

get '/' do
  JSON.generate(success: true)
end
