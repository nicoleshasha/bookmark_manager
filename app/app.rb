ENV["RACK_ENV"] ||=  "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

get '/links' do
  @links = Link.all
  erb :links
  end

get '/links/new' do
  erb :create_links
end

post '/links' do
  link = Link.create(url: params[:url], title: params[:title])
  tag = Tag.first_or_create(name: params[:tags])
  link.tags << tag
  link.save
  redirect '/links'
  end

get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb(:links)
end

    run! if app_file == $0
end
