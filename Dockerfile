FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

ENV TZ=America/Chicago

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt -y update && apt -y upgrade

RUN apt -y install python3 python3-pip git

RUN apt-get install -y --allow-change-held-packages \
    libcudnn8-dev\
    libcudnn8\
    libnvinfer-dev\
    tensorrt 

RUN pip3 install --upgrade pip

RUN pip3 install \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn

RUN pip3 install jupyterlab

RUN pip3 install tensorflow

RUN pip3 install \ 
    torch \
    torchvision

RUN pip3 install scikit-image

RUN pip3 install kaggle

COPY jupyter_notebook_config.py /root/.jupyter/
COPY kaggle.json /root/.kaggle/
RUN chmod 600 /root/.kaggle/kaggle.json

WORKDIR /workspace
EXPOSE 8888


CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
