FROM ubuntu:20.04

RUN apt -y update && apt -y upgrade

RUN apt -y install python3 python3-pip

RUN pip3 install --upgrade pip

RUN pip3 install numpy pandas matplotlib seaborn sklearn

RUN pip3 install jupyterlab

RUN pip3 install tensorflow

COPY jupyter_notebook_config.py /root/.jupyter/

WORKDIR /workspace
EXPOSE 8888


CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--LabApp.token=''", "--port=8888", "--lab-app-password='"]