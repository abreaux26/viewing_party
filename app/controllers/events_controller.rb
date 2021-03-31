class EventsController < ApplicationController
  before_action :find_user, :find_movie
  helper_method :create_attendees, :incorrect_duration?

  def new; end

  def create
    unless incorrect_duration?
      @event = current_user.events.create(event_params)
      if @event.save
        create_attendees
        flash[:notice] = 'viewing party created!'
        redirect_to dashboard_path
      else
        flash[:error] = "You must've forgot some information, try again!"
        render :new
      end
    end
  end

  private

  def event_params
    params.permit(:name, :duration, :start_time, :api_movie_id)
  end

  def find_user
    @user = current_user
  end

  def find_movie
    @movie = MovieService.movie_detail_for(params[:api_movie_id])
  end

  def create_attendees
    if params[:friends]
      params[:friends].each do |friend|
        Attendee.create(event_id: @event.id, friend_id: friend)
      end
    end
  end

  def incorrect_duration?
    if params[:duration].to_i < @movie[:runtime].to_i
      flash[:error] = "Please enter a duration longer than #{@movie[:runtime]} minutes."
      render :new
    end
  end
end
