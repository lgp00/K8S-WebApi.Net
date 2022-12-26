# K8S-WebApi.Net
Docker + .net 6 + Kubectl + Web Api + Docker Support

### Description
so now you can use a webapi in a container locally ... soon maybe in the cloud
### How to use it
- speedy way:

download the deployment.yaml + service.yaml & execute the kubectl apply -f (filename) 

K8s will do the job 
- github

you can download the repo and cd in the project (maybe taking a look around) & execute the kubectl apply -f (filename) 
### How i achived this
- created a project (JB Rider) <img src="https://i.postimg.cc/9M0VcgV0/Screenshot-2022-12-23-at-17-44-38.png" width="350" height="350">
- i moved the Dockerfile up ../ `mv Dockerfile ../` because of some COPY issue in the docker file
- i've built the docker file `docker build -t projectdimitri/rainydays:v1 .`
- i've pushed the docker file to docker hub `docker push projectdimitri/rainydays:v1`
- well now that we have the image we can build the thing and go K8S 
- create deployment file: `kubectl create deployment rainydays --image projectdimitri/rainydays:v1 --port 80 -oyaml --dry-run=client> deployment.yaml`
- create service file: `kubectl expose deployment rainydays --type NodePort --port=80 --name rainydays-service -oyaml --dry-run=client> service.yaml `
- Docker is open and functional yes ?  <img src="https://i.postimg.cc/wBXdNtPk/Screenshot-2022-12-26-at-15-25-12.png" width="50" height="50">
- lets apply them: `kubectl apply -f deployment.yaml && k apply -f service.yaml`
- congrats
- docker cotainers running: <img src="https://i.postimg.cc/3R3QF8QQ/Screenshot-2022-12-26-at-15-36-19.png" width="350">
- lets see the api thing on the browser `kubectl get svc -owide`
- identify the service port `80:XXXXX/TCP` <img src="https://i.postimg.cc/3NKfd10g/Screenshot-2022-12-26-at-16-01-08.png" width="550"> 
- now you could CURL or check it in the browser
  - BROWSER = `http://localhost:XXXXX/weatherforecast`
  - CURL = `curl http://localhost:XXXXX/weatherforecast`
