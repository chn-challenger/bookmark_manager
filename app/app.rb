require 'sinatra/base'
require_relative 'models/link.rb'
require_relative '../data_mapper_setup'
require 'dotenv'
Dotenv.load

class BookmarkManager < Sinatra::Base
  set :views, proc{File.join(root, '..' , 'views')}

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links/new' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end
end
