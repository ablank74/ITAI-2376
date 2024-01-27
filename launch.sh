#!/bin/bash


if [[ $(id -nG) =~ "docker" ]] ; then
    echo "$USER in Docker Group"
else
  # Add the current user to the Docker group
  echo "Adding $USER to the Docker group"
  sudo usermod -aG docker $USER
  echo "User added to the Docker group and restarting Docker"
  sudo systemctl restart docker
fi


docker build . -t itai-2376
docker run -it --rm --gpus=all -p 8888:8888 -p 5000:5000 -v /home/adam/GitRepos/ITAI-2376/notebooks:/root/notebooks itai-2376