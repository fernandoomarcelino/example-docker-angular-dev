# Angular + Docker

this project is a simple way to use angular with docker in development environment.

## requirements
- Docker

## How to use to create an angular application without any files
1. After downloading this project, run:
```
docker-compose up --build
```
2. Access the container with the command
```
docker-compose exec app-angular bash
```
4. Inside the container you will be in an environment with angular installed globally.
- Then create a new angular project
- [Angular](https://angular.io/cli)
- for example:
```
ng new my-first-project --directory ./
```
4. Then, add the instruction in the package.json file:
```
...
"scripts": {
    ...
    "start": "ng serve --host 0.0.0.0 --port 4200",
    ...
},
...
```
- this command is necessary to start the ng server when starting the container but allow external access to the server.
5. Lastly, update the CMD from the dockerfile file
- FROM
```
CMD ["tail", "-f", "/dev/null"]
#CMD ["sh", "-c", "npm install && npm start"]
```
- TO
```
CMD ["sh", "-c", "npm install && npm start"]
```
6. Finished! 
- Because the Dockerfile has been changed, it will be necessary to run the command again:
```
docker-compose up --build
```
- Next time you start the application use the command below and your server will be ready to receive requests.
```
docker-compose up -d
```

## How to use if you already have an angular project
- You can simply copy the Dockerfile and docker-compose.yml files into your project. Then adjust versions of: npm and angular cli, also correct workdir path
