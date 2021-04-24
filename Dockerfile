from partlab/ubuntu-golang
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN useradd -ms /bin/bash worker
USER worker
#RUN export PATH=$PATH:$(go env GOPATH)/bin
USER root
RUN mkdir -p /home/worker/dero/
COPY derosuite/ /home/worker/dero/
RUN cp -avr /home/worker/dero/derosuite /home/worker/
RUN cd /home/worker/dero && ls -la 
USER root
#ADD . /opt/go/src/myapp
#RUN go get github.com/deroproject/derosuite RUN go install myapp
#RUN go install myapp

#ENTRYPOINT /opt/go/bin/myapp
EXPOSE 8080

#RUN cd derosuite
