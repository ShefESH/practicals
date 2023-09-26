#!/bin/bash
for i in {1..100}; do \
        useradd -m -s /bin/bash -p "$(openssl passwd -1 user${i})" user$i; \
done

while true; do sleep 1; done
