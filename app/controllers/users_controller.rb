class UsersController < Sinatra::Base

  get '/users/new' do
    erb :create_user
  end


end
