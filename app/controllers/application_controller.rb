
class ApplicationController < ActionController::Base
  def index

    query_string = params[:query_string]

    unless query_string.nil? or query_string.empty?
      begin
        address = Address.new
        weather = Weather.new ENV['OPENWEATHERMAP_KEY']

        parsed_address = address.address_parse(query_string)
        city = parsed_address[:city]
        zip_code = parsed_address[:zipcode]
        @city = city
        @zip_code = zip_code
        @from_cache = false

        if zip_code.nil? or zip_code.empty?
          weather = weather.weather(parsed_address[:city])
        else
          @from_cache = Rails.cache.exist? parsed_address[:zipcode]
          if @from_cache
            weather = Rails.cache.read parsed_address[:zipcode]
          else
            weather = weather.weather(parsed_address[:city])
            Rails.cache.write(zip_code, weather, :timeToLive => 30.minutes)
          end
        end
        @current_temperature = weather["main"]["temp"]
        @min_temperature = weather["main"]["temp_min"]
        @max_temperature = weather["main"]["temp_max"]


      rescue StandardError => e
        puts e.message
        @error = "Can't process entered data"
      end
    end
  end
end