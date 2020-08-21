#!/bin/bash

# Para darle tiempo al servicio de iniciar
sleep 1

res=$(curl -I http://localhost:5000 2>&1)

if echo "$res" | grep -q "HTTP/1.1 200 OK"; then
    echo "Test Ok."
    exit 0
fi

echo "El servicio no ha pasado el test."
exit 1
