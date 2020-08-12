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
