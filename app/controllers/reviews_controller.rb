class ReviewsController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/reviews' do
    # @user = User.find(session[:user_id])
    @reviews = Review.all
    erb :review
  end

  get '/reviews/new' do
    erb :create_review
  end

  post '/reviews' do
    @user = User.find(session[:user_id])
    @restaurant = Restaurant.create(name: params[:restaurant][:name])
    @review = Review.create(user: @user, date: Time.now, restaurant: @restaurant, rating: params[:review][:rating], content: params[:review][:content])
    redirect '/reviews'
  end

  get '/users/:user_id/reviews' do
    @user = User.find(session[:user_id])
    erb :show
  end

  get '/users/:user_id/reviews/:review_id/edit' do
    @user = User.find(session[:user_id])
    @review = Review.find(params[:review_id])
    "Edit review"
  end

end
