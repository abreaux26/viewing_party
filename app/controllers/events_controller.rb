class EventsController < ApplicationController
  before_action :find_user, :find_movie
  helper_method :create_attendees, :incorrect_duration?

  def new; end

  def create
    return if incorrect_duration?

    @event = current_user.events.create(event_params)
    if @event.save
      create_attendees
      email_friends
      redirect_to dashboard_path
    else
      flash[:error] = "You must've forgot some information, try again!"
      render :new
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
    return unless params[:friends]

    params[:friends].each do |friend|
      Attendee.create(event_id: @event.id, friend_id: friend)
    end
  end

  def incorrect_duration?
    return unless params[:duration].to_i < @movie[:runtime].to_i

    flash[:error] = "Please enter a duration longer than #{@movie[:runtime]} minutes."
    render :new
  end

  def email_friends
    @event.friends.each do |friend|
      recipient = friend.email

      email_info = {
        user: current_user,
        friend: friend.username,
        message: @event.message
      }

      FriendNotifierMailer.inform(email_info, recipient).deliver_now
      flash[:notice] = 'viewing party created!'
    end
  end
end
