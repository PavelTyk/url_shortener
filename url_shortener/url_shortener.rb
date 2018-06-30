require File.expand_path '../url.rb', __FILE__

# This is a place to keep business logic for the URL shortener app.
# Consider it as a top level abstraction / entry point for console usage.
class UrlShortener
  VALID_KEYS_FOR_TRACK_CLICK = %w[
    REMOTE_ADDR HTTP_USER_AGENT REQUEST_METHOD HTTP_VERSION HTTP_REFERER SERVER_NAME HTTP_ACCEPT HTTP_ACCEPT_ENCODING
    HTTP_ACCEPT_LANGUAGE
  ].freeze

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

    # Tracks redirect (URL click) at persistance layer.
    # All valuable request attributes are stored for later async processing.
    # Ideally persistance layer should be in memory storage, however for purpose of test task Postgres will be fine.
    # Params:
    # +url+:: +Url+ object to track redirect for
    # +request_headers+:: +Hash+ with valuable request headers.
    #   Valid keys are listed in +VALID_KEYS_FOR_TRACK_CLICK+ constant.
    def track_click(url, request_headers)
      valid_keys = VALID_KEYS_FOR_TRACK_CLICK

      request_headers.each_key do |k|
        unless valid_keys.include?(k)
          raise ArgumentError.new("Unknown key: #{k.inspect}. Valid keys are: #{valid_keys.map(&:inspect).join(', ')}")
        end
      end

      url
    end
  end
end
