class TeamsController < ApplicationController

  get '/teams' do
    @teams = Team.all
    #render the index view
    erb :"teams/index"
  end

  get '/teams/new' do
    @users = User.all
    #render the new view
    erb :"teams/new"
  end

  post '/teams' do

  end

  get'/teams/:id' do
    @team = Team.find_by_id(params[:id])
    if @team
      erb :"teams/show"
    else
      #redirect to the /teams route
      redirect '/teams'
    end
  end

end
