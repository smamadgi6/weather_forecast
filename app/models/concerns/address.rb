require 'geocoder'

class Address
  def address_parse (address)
  	#Geocoder.configure(always_raise: [SocketError, Timeout::Error])
    response = Geocoder.search(address)
    puts "response is *************"
    puts response
    first = response.first
    puts "first is #{first}"

    unless first.nil?
    {
      zipcode: first.postal_code,
      city: first.city,
    }

    end
  end
end
