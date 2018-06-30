class UrlAnalytics
  def initialize(url)
    @url = url
  end

  # Collect analytics data.
  # The idea for data processing is:
  # 1. Have background process to process UrlClick#request_headers and save data in indexable format
  # 2. Write a query for each metric. For example: @url.url.clicks.group(:referrer).count
  # 3. Optionally store results in cache with expiration time for subsequent requests
  def collect_data
    {
      'clicks' => @url.url_clicks.count,
      'referrers' => 0,
      'countries' => 0,
      'browsers' => 0,
      'platforms' => 0,
    }
  end
end
