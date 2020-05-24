class UsersController < ApplicationController
  get "/" do
    erb :index
  end

  #
  # get "/signup" do
  #   erb :signup
  # end
  #
  # post "/signup" do
  #   if params[:username]=="" || params[:password]==""
  #     redirect to '/failure'
  #   end
  #
  #   user = User.new(:username => params[:username], :password => params[:password])
  #   if user.save
	# 		redirect to "/login"
	# 	else
	# 		redirect to "/failure"
	# 	end
  # end
  #
  # get '/account' do
  #   @user = User.find(session[:user_id])
  #   erb :account
  # end


end
