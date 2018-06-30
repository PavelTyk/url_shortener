# View for URL. Initialized with request.
class UrlView
  def initialize(request)
    @request = request
  end

  # Render URL as JSON.
  def render_one(url)
    JSON.generate({
      "id": build_absolute_url(url.uid),
      "longUrl": url.long_url,
    })
  end

  private

  def build_absolute_url(path)
    @request.scheme + '://' + @request.host_with_port + '/' + path.to_s
  end
end
