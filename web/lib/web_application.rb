require 'sinatra/base'

class WebApplication < Sinatra::Base
  set :run, false
  set :public, './public'
  set :views, './views'

  get '/' do
    @current_time = Time.now
    erb :index
  end
end
