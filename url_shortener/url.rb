require 'sinatra/activerecord'
require 'base58_gmp'
require File.expand_path '../url_click.rb', __FILE__

class Url < ActiveRecord::Base
  has_many :url_clicks, dependent: :delete_all

  # Returns Base58 encoded +id+ to represent big numbers in a shorter and more user-friendly format.
  def uid
    id && Base58GMP.encode(id)
  end

  def self.find_by_uid(uid)
    uid && id = Base58GMP.decode(uid) and find_by(id: id)
  end
end
