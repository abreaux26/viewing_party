class MoviesController < ApplicationController
  def discover; end

  def search
    @top_forty = @movie_service.top_forty if params[:q] == 'top_rated'
  end
end
