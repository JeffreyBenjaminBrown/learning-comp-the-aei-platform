# This is hdoupe/matchups:latest (as of 2019-03-01)

FROM continuumio/miniconda3

USER root
RUN  apt-get update && apt install libgl1-mesa-glx git --yes

COPY ./ /home/Matchups
WORKDIR /home/Matchups

RUN conda install pip pandas pyarrow bokeh
RUN pip install -U python-dateutil pytest
RUN pip install -e .
