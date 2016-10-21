require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require_relative '../data_mapper_setup'

class Link

  include DataMapper::Resource

  property :id,       Serial
  property :title,    String
  property :url,      String

  has n, :tags, :through => Resource
end

#DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
 DataMapper.finalize
 DataMapper.auto_upgrade!
