$stdout.sync = true # Solves STDOUT outpus issue on Heroku
require './url_shortener_server'

run Sinatra::Application
