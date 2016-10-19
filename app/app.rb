require 'sinatra/base'
require_relative 'models/link'

class Bookmark < Sinatra::Base

enable :sessions

get '/links' do
  @links = Link.all
  erb :links
  end

get '/links/new' do
  erb :create_links
end

post '/links' do
  Link.create(url: params[:url], title: params[:title])
  redirect '/links'
  end

    run! if app_file == $0
end
