require 'sinatra'

set :bind, '0.0.0.0'
set :logging, true

get '/' do
  'Hello World!!'
end
