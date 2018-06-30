require 'sinatra/activerecord'
# require File.expand_path '../url.rb', __FILE__

class UrlClick < ActiveRecord::Base
  belongs_to :url
end
