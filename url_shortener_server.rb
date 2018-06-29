require 'sinatra'
require 'json'
require './url_shortener/url_shortener'

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

  JSON.generate({
    "id": request.scheme + '://' + request.host_with_port + '/' + url.id,
    "longUrl": url.longUrl,
  })
end

get '/:id' do
  url = UrlShortener.find_url(params["id"])

  url ? redirect(url.longUrl, 301) : halt(404)
end

not_found do
  status 404
  'Not found'
end
