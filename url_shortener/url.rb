require 'sinatra/activerecord'
require 'base58_gmp'

class Url < ActiveRecord::Base
  # Returns Base58 encoded +id+ to represent big numbers in a shorter and more user-friendly format.
  def uid
    id && Base58GMP.encode(id)
  end

  def self.find_by_uid(uid)
    uid && id = Base58GMP.decode(uid) and find_by(id: id)
  end
end
