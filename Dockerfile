 FROM monetas/golang-base:2
 MAINTAINER "harm.aarts@monetas.net"
 RUN apt-get -y update
 RUN apt-get install -y python-pip python-dev git
 RUN pip install ansible==1.8.4
 RUN git clone http://github.com/haarts/lxc-provisioning.git /tmp/examples
 WORKDIR /tmp/examples
 ADD inventory /etc/ansible/hosts
 RUN ansible-playbook lxc.yml -c local
 RUN sudo su harm -c 'ansible-playbook -c local dev.yml'
 EXPOSE 22 3000
 CMD sudo -i -u harm fish
 #ENTRYPOINT [“/usr/bin/foo”]
