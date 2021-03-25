require 'pry'
require 'faraday'
require 'json'

class MovieService

  def top_40
    get_data('/3/movie/top_rated')
  end

  def get_data(url)
   response = authorize.get(url)
   data = response.body
   parse = JSON.parse(data, symbolize_names: true)
   binding.pry
 end

 def authorize
   Faraday.new('https://api.themoviedb.org') do |conn|
     conn.authorization :Bearer, 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNTAyZGZjNzViMzBkZDkwYTZhYTNmNWMxYThmMjBhMiIsInN1YiI6IjYwNWJlYzI0OTQ0YTU3MDAyOWE2NWFhMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BESdLe_XE56rDoqKxvLa1kE6XwqEdxmgjNBJsgwGc_s'
   end
 end
end
m = MovieService.new
m.top_40
