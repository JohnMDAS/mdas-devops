#!/bin/sh
set -e

#dependencies
dependencies(){
    go get github.com/gorilla/websocket
    go get github.com/labstack/echo
    go get github.com/go-redis/redis

    pip install requests
}

#cleanup
cleanup(){
    #pkill votingapp || ps aux | grep votingapp | awk {'print $2'} | head -1 | xargs kill -9 || true
    rm -rf build
}
#build
build(){
    mkdir build
    go build -o ./build ./src/votingapp 
    cp -r ./src/votingapp/ui ./build

    pushd build
    ./votingapp &
    popd
}

test(){
    #Comment/Uncomment to use Pyhton or NodeJS script
    #python ./tests.py
    node ./tests.js
}

retry(){
    n=0
    interval=5
    retries=3
    $@ && return 0
    until [ $n -ge $retries ]
    do
        n=$(($n+1))
        echo "Retrying...$n of $retries, wait for $interval seconds"
        sleep $interval
        $@ && return 0
    done

    return 1
}


dependencies
cleanup
build

retry test
