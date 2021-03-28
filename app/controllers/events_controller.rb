class EventsController < ApplicationController

  def new
    @movie = @movie_service.movie_detail_for(params[:movie])
  end
end