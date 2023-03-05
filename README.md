# hamclock-web-docker

## Run
Just clone the repo and run it. 
```
git clone https://github.com/SP5D/hamclock-web-docker.git
docker-compose up -d
``` 
Since image is uploaded to docker hub, you can also run it directly:
```
docker run -d -p 8080:8080 -p 8081:8081 -v ./etc_hamclock:/root/.hamclock sylogista/hamclock-web:latest hamclock-2400x1440
```
The last parameter is the resolution. You can change it to one of the predefinied(!) values.  
In the further part of this README, I've covered this topic. 

## Config - ham
By default it's in the `etc` directory, next to the `compose.yaml` file.  
Directory will be created with the first `docker-compose up -d`

## Config - resolution
Image is packed with all available resolutions.  
You can choose between them just by commenting and uncommenting the last lines in the `compose.yaml` file. (or by modyfying command in the `docker run ...`)  
All of the available hamclock resolutions (3'th is active):
```
#command: "hamclock-800x480"
#command: "hamclock-1600x960"
command: "hamclock-2400x1440"
#command: "hamclock-3200x1920"
 ```
 
 ## Build
By default, docker-compose will pull ready image from docker hub, but obviously you can `docker-compose build` it yourself.

- - -
73 de Hilary SP5D
