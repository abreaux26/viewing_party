class EventsController < ApplicationController
  def new
    @user = current_user
    @movie = MovieService.movie_detail_for(params[:movie])
  end

  def create
    @movie_details = MovieService.movie_detail_for(params[:movie])
    @user = current_user
    if params[:duration].to_i < @movie_details[:runtime].to_i
      flash[:error] = "Please enter a duration longer than #{@movie_details[:runtime]} minutes."
      @movie = @movie_details
      render :new
    else
      @movie = Movie.create(title: @movie_details[:title], api_movie_id: @movie_details[:id])
      @event = current_user.events.create(name: params[:name],
                                          duration: params[:duration],
                                          start_time: params[:start_time],
                                          movie: @movie)
      if @event.save
        if params[:friends]
          params[:friends].each do |friend|
            Attendee.create(event_id: @event.id, friend_id: friend)
          end
        end
        flash[:notice] = 'viewing party created!'
        redirect_to dashboard_path
      else
        flash[:error] = "You must've forgot some information, try again!"
        @movie = @movie_details
        render :new
      end
    end
  end
end
