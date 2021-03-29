class MoviesController < ApplicationController

  def index
    if params[:q] == 'top_rated'
      @top_forty = @movie_service.top_forty
    elsif params[:q]
      @search = @movie_service.search(params[:q])
    end
  end

  def show
    @user = current_user
    @movie = @movie_service.movie_detail_for(params[:id])
    @genres = @movie_service.genres(params[:id])
    @casts = @movie_service.casts(params[:id])
    @reviews = @movie_service.reviews(params[:id])
  end
end
