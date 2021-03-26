class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :movie_service

  def movie_service
    @movie_service ||= MovieService.new
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
