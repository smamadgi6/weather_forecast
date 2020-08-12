 Ruby On Rails applicati#on to retrieve weather for given address

## Usage using local ruby installation

1) 

```bash
     bundle install
```
2)  
```bash
     export OPENWEATHERMAP_KEY="c747296abe5241b5343bc974298c8a4f" && rails s
```


## Usage using docker
1) Install Docker and Docker compose

https://docs.docker.com/engine/install/

2) Build image: 
```bash
     docker-compose up --build
```
3) Go to http://localhost:3000 on a web browser

### Used APIs:
https://openweathermap.org

### Summary:
The application takes address as the user input as per the requirements and calls the Geocoder gem to parse the address. The Geocoder gem performs a search on an address and returns the result set. The application takes the first search object to retrieve zipcode, city, geo co-ordinates and caches the zipcode data using Rails Cacher for 30 minutes. The request to openweather API service to retrieve forecast details depends on the zipcode found in the Cache. If not found in the cache, it calls the API based on location coordinates of the address and displays forecast data to the user and then caches this for subsequent searches.

### Future Enhancements:
1) Based on detailed requirements, address validations can be implemented to avoid invalid addresses/data. 
2) Address Autocomplete feature can be added for better UX.
3) Weather related features such as hourly/future forecasts, display previous search results and swap temperature metrics between C, F, K can be implemented.

