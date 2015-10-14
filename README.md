# PHP dev for [Eintopf](https://github.com/mazehall/eintopf)

This is a simple hello world example in php. You can use this as a pattern for your own Eintopf php projects. 


## What is Eintopf?

Eintopf is a pot with the mixture of the smart development tools Docker, Vagrant and VirtualBox. Made to ease the chore of the daily project works.


## Development ready

Xdebug is enabled by default and can be used without further configuration.

Full documentation of the development environment [here](https://hub.docker.com/r/tetraweb/php/).


## Create your own php app with Eintopf

Changes in the project description will be loaded by Eintopf after a while. To be sure just restart Eintopf.


### 1. Clone the sources

Clone this [project description](https://github.com/mazehall/eintopf-php-dev) into your Eintopf configs folder (default: ~/.eintopf/default/configs)

    git clone https://github.com/mazehall/eintopf-php-dev ~/.eintopf/configs/my-php-app


### 2. Set your project name

fw change the project name to properly use your new project description in Eintopf. To do that you have to change the "name" properties in the package.json file:

    ~/.eintopf/configs/my-php-app/package.json
    {
      "name": "my-php-app", # change this
      ...
      "eintopf": {
        "name": "My php app" # change this
      ...
      
Changing of the other entries is encouraged but optional.


### 3. Set your project directory
 
Change "PROJECT_DIR" in project.sh in order to use your own project folder.

    PROJECT_DIR="my-php-app"
    
The project will then be deployed in yourEintopfAppPath/my-php-app.


You are now ready to work on your new php project.


### 4. Set your virtual host name

Change "VIRTUAL_HOST" in the docker-compose.yml. You have to set this in order to get through the proxy.

    environment:
      - VIRTUAL_HOST=myphpapp.dev


### Customize your build environment

- Customize docker-compose.yml to suit your project environment (optional)
- Customize your build steps (optional)
  - keep in mind that the build can be started in and outside of the eintopf box
  - use the callInbox helper function from project.env.sh
- Add Eintopf custom actions (optional)