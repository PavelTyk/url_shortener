require File.expand_path '../../spec_helper.rb', __FILE__

describe "UrlShortener" do
  describe ".track_click" do
    it 'allows valid keys in params' do
      url = UrlShortener.shorten_url('http://example.com')

      # Construct a hash with all valid keys, and values 1 to N
      params = UrlShortener::VALID_KEYS_FOR_TRACK_CLICK.zip((1..100).to_a).to_h

      expect {
        UrlShortener.track_click(url, params)
      }.to_not raise_error
    end

    it 'throws an exception on invalid key in params' do
      url = UrlShortener.shorten_url('http://example.com')

      expect {
        UrlShortener.track_click(url, 'UNKNOWN' => 'KEY')
      }.to raise_error(ArgumentError, /Unknown key: "UNKNOWN"/)
    end
  end
end
