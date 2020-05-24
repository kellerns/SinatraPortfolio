class RestaurantsController < ApplicationController

  get '/restaurants/new' do
    erb :"/restaurants/new"
  end

  post '/restaurants' do
    redirect '/restaurants/new?error=Invalid form submission, please try again:' if params.values.any?(&:empty?) || Restaurant.find_by(name: params[:name])
    restaurant = Restaurant.create(
      name: params[:name]
    )
    redirect "/restaurants/#{restaurant.id}"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find_by(id: params[:id])
    redirect :'restaurants/new' unless @restaurant
    @error = params[:error]
    user_ids = @restaurant.reviews.map { |review| review[:user_id] }
    @users = User.all.select { |user| user_ids.include?(user.id) }
    erb :"/restaurants/show"
  end

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :"/restaurants/index"
  end

end
