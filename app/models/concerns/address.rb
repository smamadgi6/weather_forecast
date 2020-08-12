require 'geocoder'

class Address
  def address_parse (address)
  	
    response = Geocoder.search(address)
    
    first = response.first 
    {
      zipcode: first.postal_code,
      city: first.city,
    }

  end
end
