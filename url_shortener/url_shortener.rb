require File.expand_path '../url.rb', __FILE__

# This is a place to keep business logic for the URL shortener app.
# Consider it as a top level abstraction / entry point for console usage.
class UrlShortener
  class << self
    # Persists URL and returns +Url+ object.
    # Params:
    # +url+:: +String+ to be shortened
    def shorten_url(url)
      Url.create(long_url: url)
    end

    # Finds URL and returns +Url+ object.
    # Params:
    # +uid+:: +String+ representing base58 encoded id of URL (produced by `shorten_url`)
    def find_url(uid)
      Url.find_by_uid(uid)
    end
  end
end
