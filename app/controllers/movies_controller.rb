class MoviesController < ApplicationController
  def discover; end

  def search
    if params[:q] == "top_rated"
      @top_forty = @movie_service.top_forty
    elsif params[:q]
      @search = @movie_service.search(params[:q])
    else
    end

  end
end
