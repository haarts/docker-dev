FROM registry.monetas.io/golang-base:latest
MAINTAINER "harm.aarts@monetas.net"

#ADD bashrc /opt/bashrc
RUN DEBIAN_FRONTEND=noninteractive apt-get install tmux vim -y -q
COPY bashrc /opt/bashrc

RUN echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/runner

RUN useradd --create-home runner
COPY runner_bashrc /home/runner/.bashrc

WORKDIR /opt/go/src/github.com/monetas/gotary
CMD /opt/run_services.sh &&\
    $GOPATH/src/github.com/monetas/gotary/scripts/database/install.sh && \
    cd $GOPATH/src/github.com/monetas/gotary && \
    su runner
