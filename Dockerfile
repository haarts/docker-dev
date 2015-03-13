FROM monetas/golang-base:latest
MAINTAINER "harm.aarts@monetas.net"

#ADD bashrc /opt/bashrc
RUN echo "export GOPATH=/opt/go GOROOT=/opt/go_dist PATH=/opt/go_dist/go/bin/:$PATH" >> /opt/bashrc
RUN adduser --uid 1001 --system runner
CMD sh /opt/run_services.sh &&\
    sudo -u runner bash --rcfile /opt/bashrc
