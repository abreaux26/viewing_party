class MovieService
  def connection
    Faraday.new('https://api.themoviedb.org') do |conn|
      conn.authorization :Bearer, (ENV['MOVIEDB_TOKEN']).to_s
    end
  end

  def top_forty
    page1 = get_data('/3/movie/top_rated?page=1')
    page2 = get_data('/3/movie/top_rated?page=2')
    (page1[:results] + page2[:results]).map do |data|
      SearchMovie.new(data)
    end
  end

  def get_data(url)
    response = connection.get(url)
    data = response.body
    JSON.parse(data, symbolize_names: true)
  end
end
