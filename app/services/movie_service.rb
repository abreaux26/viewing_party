require 'pry'
require 'faraday'
require 'json'

class MovieService

  def top_40
    get_url('https://api.themoviedb.org/3/movie/top_rated')
  end

  def get_data(url)
   response = authorize.get(url)
   data = response.body
   JSON.parse(data, symbolize_names: true)
  end

 def get_url(url)
   Faraday.get(url) do |conn|
     conn.headers['Authorization'] = "Bearer #{ENV['MOVIEDB_TOKEN']}"
   end
 end
end
m = MovieService.new
binding.pry

p m.top_40
