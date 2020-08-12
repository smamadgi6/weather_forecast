require 'geocoder'

class Address
  def address_parse (address)
  	begin
    response = Geocoder.search(address)
    if response.nil? or response.first.nil?
      return {
        zipcode: '',
        city: '',
        coordinates: []
      }
    end
    
    first = response.first 
    {
      zipcode: first.postal_code,
      city: first.city,
      coordinates: first.coordinates
    }
    rescue StandardError => e
        puts e.message
        if e.message.eql?("Geocoding API connection cannot be established.")
        	then 
        	@error = "Geocoding API connection cannot be established."
        else

        @error = "Cannot process entered data, please retry"
    end
      end

  end
end
