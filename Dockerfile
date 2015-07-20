FROM monetas/golang-base:latest
MAINTAINER "harm.aarts@monetas.net"

#ADD bashrc /opt/bashrc
RUN DEBIAN_FRONTEND=noninteractive apt-get install tmux -y -q
RUN echo "export GOPATH=/opt/go GOROOT=/opt/go_dist/go PATH=/opt/go_dist/go/bin/:$PATH" >> /opt/bashrc
RUN adduser --uid 1001 --system runner
RUN echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/runner
WORKDIR /opt/go/src/github.com/monetas/gotary
CMD sh /opt/run_services.sh &&\
    cd $GOPATH/src/github.com/monetas/gotary/scripts/database/ && sh install.sh && \
    cd ../.. && \
    sudo -u runner bash --rcfile /opt/bashrc
