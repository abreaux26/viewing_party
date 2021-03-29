class EventsController < ApplicationController

  def new
    @user = current_user
    @movie = @movie_service.movie_detail_for(params[:movie])
  end
end