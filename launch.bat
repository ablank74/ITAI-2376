docker build . -t ITAI-2376
docker run -it --rm --gpus=all -p 8888:8888 -p 5000:5000 -v C:\GitRepos\ITAI-2376\notebooks:/root/notebooks ITAI-2376