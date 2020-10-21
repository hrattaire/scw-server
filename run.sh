#!/bin/bash
set -eu

# Import config file
set -a
source ./config
set +a

docker-compose up --detach --build