class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #user is now logged in
      redirect "/teams"
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def session_info
      session
    end
  end








end
