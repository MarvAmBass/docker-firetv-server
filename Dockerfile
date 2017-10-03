FROM debian:jessie

RUN export DEBIAN_FRONTEND=noninteractive \
 \
 && apt-get -q -y update \
 && apt-get -q -y install curl \
                          git \
                          python \
                          python-pip \
                          python-m2crypto \
                          libusb-1.0-0 \
                          android-tools-adb \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 \
 && pip install --upgrade pip \
 && pip install pyyaml \
 && pip install flask \
 && pip install firetv[firetv-server] \
 && pip install git+git://github.com/google/python-adb.git@master

EXPOSE 5556

CMD firetv-server -d $FIRETV:5555
