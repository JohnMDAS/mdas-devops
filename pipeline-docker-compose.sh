#!/bin/bash
set -e
#cleanup
docker-compose rm -f && \
#build
docker-compose up -d && \
#tests run --rm devuelve codigo de retorno
docker-compose run --rm mytest && \
#delivery
docker-compose push && \
echo "GREEN" || echo "RED"