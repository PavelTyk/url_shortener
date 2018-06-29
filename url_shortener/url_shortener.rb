require File.expand_path '../url.rb', __FILE__

# This is a place to keep business logic for the URL shortener app.
# Consider it as a top level abstraction / entry point for console usage.
class UrlShortener
  @storage = {}

  class << self
    # Persists URL and returns +Url+ object.
    # Params:
    # +url+:: +String+ to be shortened
    def shorten_url(url)
      id = @storage.size.to_s
      @storage[id] = Url.new(id, url)
    end

    # Finds URL and returns +Url+ object.
    # Params:
    # +id+:: +String+ representing id of URL (produced by `shorten_url`)
    def find_url(id)
      @storage[id]
    end
  end
end
