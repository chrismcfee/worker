from partlab/ubuntu-golang
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN useradd -ms /bin/bash worker
USER worker
WORKDIR /home/worker
#RUN export PATH=$PATH:$(go env GOPATH)/bin
USER root
RUN mkdir -p /home/worker/dero/
ADD derosuite/ /home/worker/dero/
#RUN cd ~/ && cp -avr derosuite/ /home/worker/dero
#RUN mkdir /home/worker/gopath && cd /home/worker/gopath && GET SHIT HERE
RUN cd /home/worker/derosuite && cat /home/worker/derosuite/README.md
USER root
#ADD . /opt/go/src/myapp
#RUN go get github.com/deroproject/derosuite RUN go install myapp
#RUN go install myapp

#ENTRYPOINT /opt/go/bin/myapp
EXPOSE 8080

#RUN cd derosuite
