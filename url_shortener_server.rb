require 'sinatra'
require 'json'
require './url_shortener/url_shortener'

before do
  content_type :json
end

post '/urlshortener/v1/url' do
  url = UrlShortener.shorten_url(params["longUrl"])

  JSON.generate({
    "id": request.scheme + '://' + request.host_with_port + '/' + url.id,
    "longUrl": url.longUrl,
  })
end

get '/:id' do
  url = UrlShortener.find_url(params["id"])

  if url
    redirect url.longUrl, 301
  else
    halt(404)
  end
end

not_found do
  status 404
  'Not found'
end
