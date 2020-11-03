# DevOps @ {{ VPS }

## Domain: {{ domain.region }}

### install

Setup the prerequisities of the devops domain

1) Create a Docker Network for frontend & backend containers

``` sh
docker network create $networkName
```

2) Create the required /static folders

``` sh
(mkdir ~/devops/$domain/data) && \
(mkdir ~/devops/$domain/images) && \
(mkdir ~/devops/$domain/privacy) && \
```

3) Download the LDutils DevOps DEV-INF/domain scripts into /DEV-INF folder

``` sh
wget https://github.com/lildutils/ldu-devtools-devinf.git#1.5.1
```

4) Set the configurations in /DEV-INF/configs.json file

### run

Stop the container and pull the new image, and run the container from new image

``` sh
./DEV-INF/run-$module.sh
```

## 

Chears :)
