require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fantasymanager"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      #double bang to return a boolean true
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by_id(session[:user_id]) if logged_in?
    end
  end

end
