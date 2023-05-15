FROM python:3.11

RUN apt-get clean \
        && apt-get -y update \
        && apt-get -y upgrade \
        && apt-get install usbutils \
        && apt-get install nano \
        && apt-get install sudo

RUN pip install --upgrade pip

RUN useradd -m user
USER user
