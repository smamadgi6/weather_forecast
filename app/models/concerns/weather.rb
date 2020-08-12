require 'faraday'
require 'json'

class Weather

  def initialize (api_key)
    @api_key = api_key
  end

  def weather (coordinates)
  	response = Faraday.get "https://api.openweathermap.org/data/2.5/weather?lat=#{coordinates[0]}&lon=#{coordinates[1]}&appid=#{@api_key}&units=imperial"
    #response = Faraday.get "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{@api_key}&units=imperial"
    JSON.parse(response.body)
  end
end
