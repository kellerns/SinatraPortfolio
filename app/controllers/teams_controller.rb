class TeamsController < ApplicationController

  get '/teams' do
    @teams = Team.all
    #render the index view
    erb :"teams/index"
  end


end
