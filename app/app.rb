require 'sinatra/base'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base
  set :views, proc{File.join(root, '..' , 'views')}

  get '/' do
    erb :index
  end
end
