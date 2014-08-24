# Docker recipe for [dogeblockd](https://github.com/dogeparty/dogeblockd)

See the global picture how this container interacts with other components to run Dogeparty:

[Global Component Overview](http://www.inkpad.io/1GMXYwxl4Q)


## Build

    docker build -t dogeblockd:v1 .


## Instantiate Data Container

    docker run -d --name=dogeblockd-data dogeblockd:v1 bash


## Run Container

    docker run -it --name dogeblockd --volumes-from=dogeblockd-data --link insight-doge:insight --link dogepartyd:dogepartyd --link mongo:mongo dogeblockd:v1 bash


## Process

    counterblockd --counterpartyd-rpc-connect=dogepartyd --counterpartyd-rpc-port=4000 --counterpartyd-rpc-user=user --counterpartyd-rpc-password=pass --blockchain-service-name=insight --blockchain-service-connect=http://$INSIGHT_PORT_3000_TCP_ADDR:$INSIGHT_PORT_3000_TCP_PORT --mongodb-connect=$MONGO_PORT_27017_TCP_ADDR --mongodb-port=27017 --rpc-host=0.0.0.0 --rpc-port=4100 --socketio-host=0.0.0.0 --socketio-port=4101 --socketio-chat-host=0.0.0.0 --socketio-chat-port=4102


## Debug

    docker run -it --rm --volumes-from=dogeblockd-data dogeblockd:v1 bash

