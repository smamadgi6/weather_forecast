require_relative '../app/models/concerns/weather'
require_relative '../app/models/concerns/address'

query_string = ARGV[0]

address = Address.new
weather = Weather.new ENV['OPENWEATHERMAP_KEY']

parsed_address = address.address_parse(query_string)
city = parsed_address[:city]
zip_code = parsed_address[:zipcode]
puts "Resolved city: #{city}, zip code: #{zip_code}"

if Rails.cache.exist? parsed_address[:zipcode]
  weather = Rails.cache.read parsed_address[:zipcode]
  puts "Read from cache for zip code #{zip_code}"
else
  weather = weather.weather(parsed_address[:city])
  Rails.cache.write(zip_code, weather, :timeToLive => 30.minutes)
end

min_temperature = weather["main"]["temp_min"]
max_temperature = weather["main"]["temp_max"]

puts "Temperature min: #{min_temperature}, temperature max: #{max_temperature}"
