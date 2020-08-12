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
The application takes address as the user input as per the requirements and calls the Geocoder api service to parse the address. The Geocoder performs a search on address and returns the result set. The application takes the first search object to retreive  zipcode and city and caches the zipcode data using Rails Cacher for 30 minutes. The request to openweather api service to retrieve forecast details depends on the zipcode found in Cache.If not in cache, it calls the api based on weather coordinates of the address and displays forecast data to the user.

### Future Enhancements:
1) Address Validation can be done to avoid invalid addresses. 
2) Address Autocomplete feature can be added for better UX.
3) Weather related features such as hourly/future forecasts, display previous search results and swap metric between C, F, K.
