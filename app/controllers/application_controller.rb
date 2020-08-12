
class ApplicationController < ActionController::Base
  def index

    query_string = params[:query_string]
     unless query_string.nil? or query_string.empty?
      verifier = MainStreet::AddressVerifier.new(query_string)
        unless verifier.success?
          @error = "Address in incorrect"
          return
        end
      begin
        address = Address.new
        weather = Weather.new ENV['OPENWEATHERMAP_KEY']
        
        parsed_address = address.address_parse(query_string)
         if parsed_address[:city].nil? or parsed_address[:city].empty?
          puts "City not found"
          @error = "City not found"
          return
         end  
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
        weather_first = weather["weather"].first
        if weather_first.nil?
          @weather_main = ''
          @weather_desc = ''
        else
        @weather_main =  weather_first["main"]
        @weather_desc =  weather_first["description"]
        end

      rescue StandardError => e
        puts e.message
        @error = "Cannot process entered data, please retry"
      end
    end
  end
end