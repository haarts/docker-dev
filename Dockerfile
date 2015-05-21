FROM monetas/golang-base:latest
MAINTAINER "harm.aarts@monetas.net"

#ADD bashrc /opt/bashrc
RUN echo "export GOPATH=/opt/go GOROOT=/opt/go_dist/go PATH=/opt/go_dist/go/bin/:$PATH" >> /opt/bashrc
RUN adduser --uid 1001 --system runner
WORKDIR /opt/go/src/github.com/monetas/gotary
CMD sh /opt/run_services.sh &&\
    cd $GOPATH/src/github.com/monetas/gotary/Dockerfiles && sh install.sh &&\
    sudo -u runner bash --rcfile /opt/bashrc
