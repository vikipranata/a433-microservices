#!/bin/bash
echo "========= Membuat Docker image ========="
echo
docker build -t karsajobs-ui:latest .
echo

echo "========= Malihat daftar image ========="
echo
sleep 1s
docker image ls
echo

echo "========= Mengubah nama image agar sesuai dengan format Docker Hub ========="
echo
sleep 1s
docker tag karsajobs-ui:latest vikipranata/karsajobs-ui:latest
echo

echo "=========Login ke Docker Hub ========="
echo
sleep 1s
echo $PASSWORD_DOCKER_HUB | docker login --username vikipranata --password-stdin

echo "========= Mengunggah image ke Docker Hub ========="
echo
sleep 1s
docker push vikipranata/karsajobs-ui:latest
echo
