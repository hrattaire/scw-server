#!/bin/bash
set -eu

# Import config file
source ./config

docker-compose up --detach --build