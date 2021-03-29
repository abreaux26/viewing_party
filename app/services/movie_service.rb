class MovieService

  def self.search(keyword)
    page1 = get_data("/3/search/movie?page=1&query=#{keyword}")
    page2 = get_data("/3/search/movie?page=2&query=#{keyword}")
    search_movie_data(page1, page2)
  end

  def self.movie_detail_for(movie_id)
    @movie_detail_for ||= get_data("/3/movie/#{movie_id}")
  end

  def self.genres(movie_id)
    movie_detail_for(movie_id)[:genres].map do |genre_data|
      genre_data[:name]
    end
  end

  def self.casts(movie_id)
    parse_data = get_data("/3/movie/#{movie_id}/credits")
    parse_data[:cast][0..9].map do |data|
      Cast.new(data)
    end
  end

  def self.reviews(movie_id)
    parse_data = get_data("/3/movie/#{movie_id}/reviews")
    parse_data[:results].map do |data|
      Review.new(data)
    end
  end

  def self.top_forty
    page1 = get_data('/3/movie/top_rated?page=1')
    page2 = get_data('/3/movie/top_rated?page=2')
    search_movie_data(page1, page2)
  end

  def self.search_movie_data(page1, page2)
    (page1[:results] + page2[:results]).map do |data|
      SearchMovie.new(data)
    end
  end

  private

  def self.connection
    Faraday.new('https://api.themoviedb.org') do |conn|
      conn.authorization :Bearer, (ENV['MOVIEDB_TOKEN']).to_s
    end
  end

  def self.get_data(url)
    response = connection.get(url)
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end
