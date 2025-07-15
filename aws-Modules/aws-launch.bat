docker build . -t aws-itai-2376 --no-cache
docker run -it --rm --gpus=all -p 8888:8888 -p 5000:5000 -v "C:\GitRepos\ITAI-2376\aws-notebooks":/workspace/notebooks aws-itai-2376