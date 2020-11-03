###################################################
## Run landing module by region
##

#!/bin/bash

main() {
    ## validate args
    if [ -z "$1" ]; then
        echo "ERR: 'project' is required"
        exit
    fi
    if [ -z "$2" ]; then
        echo "ERR: 'version' is required"
        exit
    fi
    if [ -z "$3" ]; then
        echo "ERR: 'landing port' is required"
        exit
    fi
    if [ -z "$4" ]; then
        region="hu"
    else
        region=$4
    fi

    ## process args
    project=$1
    version=$2
    port=$3
    hub=ndworks/hub-images

    ## clean
    docker container kill $project-landing-$region
    docker container rm $project-landing-$region

    ## update
    docker pull $hub:$project-landing-$region-$version

    ## run
    docker container run \
        -d \
        --name=$project-landing-$region \
        --network=$project-network \
        -p $port:8080 \
        -v /home/$project/static:/var/www/html/static \
        $hub:$project-landing-$region-$version
}

main $1 $2 $3 $4
