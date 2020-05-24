class TeamsController < ApplicationController

  get '/teams' do
    if logged_in?
      @teams = current_user.teams
      #render the index view
      erb :"teams/index"
    else
      redirect '/login'
    end
  end

  get '/teams/new' do
    @users = User.all
    #render the new view
    erb :"teams/new"
  end

  post '/teams' do
    user = User.find_by_id(params[:user_id])
    team = user.teams.build(params)
    if team.save
      redirect '/teams'
    else
      redirect '/teams/new'
    end
  end

  get '/teams/:id/edit' do
    @users = User.all
    @team = Team.find_by_id(params[:id])
    #render the edit view
    erb :"teams/edit"
  end

  patch '/teams/:id' do
    @team = Team.find_by_id(params[:id])
    if @team.update(
      name: params[:name],
      league: params[:league],
      quarterback: params[:quarterback],
      running_back_one: params[:running_back_one],
      running_back_two: params[:running_back_two],
      wide_receiver_one: params[:wide_receiver_one],
      wide_receiver_two: params[:wide_receiver_two],
      tight_end: params[:tight_end],
      kicker: params[:kicker],
      defense: params[:defense],
      wins: params[:wins],
      losses: params[:losses])
      #redirect to show view
      redirect "/teams/#{@team.id}"
    else
      #redirect to edit view
      redirect "/teams/#{@team.id}/edit"
    end
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

  delete '/teams/:id' do
    @team = Team.find_by_id(params[:id])
    if @team
      @team.delete
    end
      #redirect to the /teams route
      redirect '/teams'
  end

end
