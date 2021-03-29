class MoviesController < ApplicationController

  def index
    if params[:q] == 'top_rated'
      @top_forty = MovieService.top_forty
    elsif params[:q]
      @search = MovieService.search(params[:q])
    end
  end

  def show
    @user = current_user
    @movie = MovieService.movie_detail_for(params[:id])
    @genres = MovieService.genres(params[:id])
    @casts = MovieService.casts(params[:id])
    @reviews = MovieService.reviews(params[:id])
  end
end
