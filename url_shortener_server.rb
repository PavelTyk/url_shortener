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

post '/api/v1/urls' do
  url = UrlShortener.shorten_url(params["longUrl"])

  UrlView.new(request).render_one(url)
end

get '/api/v1/urls/:id/analytics' do
  url = UrlShortener.find_url(params["id"])
  if url
    data = UrlShortener.analytics_for(url)
    UrlView.render_json(data)
  else
    halt(404)
  end
end

get '/:id' do
  url = UrlShortener.find_url(params["id"])
  UrlShortener.track_click(url, get_valuable_headers(request)) if url

  url ? redirect(url.long_url, 301) : halt(404)
end

not_found do
  status 404
  'Not found'
end

def get_valuable_headers(request)
  request.env.slice(*UrlShortener::VALID_KEYS_FOR_TRACK_CLICK)
end
