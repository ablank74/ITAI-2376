docker build . -t itai-2376
docker run -it --rm --gpus=all -p 8888:8888 -p 5000:5000 -v C/home/adam/GitRepos/ITAI-2376/notebooks:/root/notebooks itai-2376