require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "foodreview"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :create_user
  end

  post "/signup" do
    if params[:username]=="" || params[:password]==""
      redirect to '/failure'
    end

    user = User.new(:username => params[:username], :password => params[:password])

    if user.save
			redirect to "/login"
		else
			redirect to "/failure"
		end
  end

  get '/my_reviews' do
    @user = User.find(session[:user_id])
    erb :user_reviews
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    user = User.find_by(:username => params[:username])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to "/my_reviews"
		else
			redirect to "/failure"
		end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end



end
