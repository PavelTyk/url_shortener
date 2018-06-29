configure :test do
  set :database, 'postgres://localhost/url_shortener_api_test'
end

configure :development do
  set :database, ENV['DATABASE_URL'] || 'postgres://localhost/url_shortener_api_dev'
end

configure :production do
  set :database, ENV['DATABASE_URL']
end
