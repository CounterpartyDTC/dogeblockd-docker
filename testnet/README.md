## Build

    docker build -t dogeblockd:testnet .


## Instantiate Data Container

    docker run -d --name=dogeblockd-testnet-data dogeblockd:testnet bash


## Run Container

    docker run -it --name dogeblockd-testnet --volumes-from=dogeblockd-testnet-data --link insight-doge-testnet:insight --link dogepartyd-testnet:dogepartyd --link mongo-testnet:mongo dogeblockd:testnet bash


## Process

    counterblockd --testnet --counterpartyd-rpc-connect=dogepartyd --counterpartyd-rpc-port=14000 --counterpartyd-rpc-user=user --counterpartyd-rpc-password=pass --blockchain-service-name=insight --blockchain-service-connect=http://insight:3001 --mongodb-connect=mongo --mongodb-port=27017 --rpc-host=0.0.0.0 --rpc-port=14100 --socketio-host=0.0.0.0 --socketio-port=14101 --socketio-chat-host=0.0.0.0 --socketio-chat-port=14102


## Debug

    docker run -it --rm --volumes-from=dogeblockd-data dogeblockd:testnet bash

