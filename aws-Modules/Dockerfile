#FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
FROM nvcr.io/nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

ENV TZ=America/Chicago

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install python3 python3-pip git 

RUN apt-get install -y --allow-change-held-packages \
    libcudnn8-dev\
    libcudnn8\
    libnvinfer-dev

RUN pip3 install --upgrade pip
RUN Pip3 install tensorflow-gpu

RUN pip3 install jupyterlab 

COPY jupyter_notebook_config.py /root/.jupyter/
COPY jupyter_lab_config.py /root/.jupyter/

WORKDIR /workspace
EXPOSE 8888


CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root",  "--notebook-dir=/root/notebooks"]
