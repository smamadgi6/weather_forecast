require 'geocoder'

class Address
  def address_parse (address)
  	
    response = Geocoder.search(address)
    if response.nil? or response.first.nil?
      return {
        zipcode: '',
        city: '',
      }
    end
    
    first = response.first 
    {
      zipcode: first.postal_code,
      city: first.city,
    }

  end
end
