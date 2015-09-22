require 'sinatra/base'
require_relative 'models/link.rb'
require_relative '../data_mapper_setup'

class BookmarkManager < Sinatra::Base
  set :views, proc{File.join(root, '..' , 'views')}

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
end
