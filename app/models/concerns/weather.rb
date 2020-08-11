require 'faraday'
require 'json'

class Weather
  def initialize (api_key)
    @api_key = api_key
  end

  def weather (city_name)
    response = Faraday.get "https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{@api_key}"

    JSON.parse(response.body)
  end
end
