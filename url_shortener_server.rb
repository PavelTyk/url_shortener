require 'sinatra'
require 'json'
require './url_shortener/url_shortener'
require './views/url_view'
require './config'

before do
  content_type :json
end

before do
  if request.request_method == 'POST'
    json_params = JSON.parse(request.body.read) rescue {}
    params.merge!(json_params)
  end
end

post '/urlshortener/v1/url' do
  url = UrlShortener.shorten_url(params["longUrl"])

  UrlView.new(request).render_one(url)
end

get '/:id' do
  url = UrlShortener.find_url(params["id"])

  url ? redirect(url.long_url, 301) : halt(404)
end

not_found do
  status 404
  'Not found'
end
