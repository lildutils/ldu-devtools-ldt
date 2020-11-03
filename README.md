# @ldu-devtools/ldt

## Git

### Init empty Git repository

git init

### Config it

git config user.name 'lildworks'
git config user.email 'lildworks@gmail.com'

### Init Git Flow

git flow init -d

### Config remote

git remote add origin 'USER_NAME@REMOTE_URL'
git push --set-upstream origin master && git push --set-upstream origin develop
git push --set-upstream origin ...

### Feature

git flow feature start 'FEATURE_NAME'
git add *
git commit -m "FEAT: COMMIT_MESSAGE"
git flow feature finish 'FEATURE_NAME'

### Release

git flow release start 'RELEASE_VERSION'
git add *
git commit -m "REL: Version bumped to v<RELEASE_VERSION>"
git flow release finish 'RELEASE_VERSION'

### PUSH

git push origin master && git push origin develop && git push origin --tags

### NOTES

(vi) message than ESC than save and exit>>:wq

## Nginx

``` sh
apt install nginx
nano /etc/nginx/nginx.conf
server_tokens off; 
nginx -t
```

``` sh
apt install php7.0-fpm
/etc/php/7.0/fpm/php.ini 
expose_php = Off
```

## SSL cert

openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out ssl.crt -keyout ssl.key

ln -s file1 link1


## Cert Bot

### renew

``` sh
service nginx stop
service php7.0-fpm stop
certbot certonly --standalone --preferred-challenges http -d $domainName
service nginx start
service php7.0-fpm start
```

## Docker

### install

``` sh
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

apt-key fingerprint ${fingerprint}

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world
```

## Development

### Install

Installs all of the dependencies for this project

``` sh
npm install
```

### Libs

Libraries, which supported by this tool:

* [Docker](https://docs.docker.com/)
* [Git](https://git-scm.com/)
* [Gradle](https://gradle.org/)
* [Jasypt](https://www.jasypt.org/)
* [Java](https://www.java.com/en/)
* [Java Decompiler](https://java-decompiler.github.io/)
* [Project Lombok](https://projectlombok.org/)
* [Maven](https://maven.apache.org/)
* [MongoDB](https://www.mongodb.com/)
* [MySQL](https://mysql.com/)
* [NGINX](https://www.nginx.com/)
* [NodeJS](https://nodejs.org/)
* [PHP](https://php.net/)
* [PostgreSQL](https://www.postgresql.org/)
* [Python](https://www.python.org/)
* [Tomcat](https://tomcat.apache.org/)
* [XAMPP](https://www.apachefriends.org/)

### CheatSheet

| command | descriptiion        | OS          |
|:--------|:--------------------|:------------|
| %~dp0   |  current root path  | Windows     |
| %~n0    |  current filename   | Windows     |
| %CD%    |  current path       | Windows     |

### Build

Builds this project to the **dist** folder and creates a zip package from the dist content into the **build** folder

``` sh
gulp build
```

## Further Help

To get more informations about this project, or if you have any question or suggestion, please send an email to [me](mailto:info@lildworks.hu)

## 

Thanks :)
