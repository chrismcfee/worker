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
COPY derosuite/ .
RUN cd ~/ && cp -avr derosuite/ /home/worker/dero
#RUN mkdir /home/worker/gopath && cd /home/worker/gopath && GET SHIT HERE
RUN cd /home/worker/dero && ls -la
RUN echo coom
USER root
ADD . /opt/go/src/myapp
#RUN go get github.com/deroproject/derosuite RUN go install myapp
RUN cd /home/worker/ && mkdir gopath && cd gopath && go get -u github.com/deroproject/derosuite/ RUN go install myapp

ENTRYPOINT /opt/go/bin/myapp
EXPOSE 8080

#RUN cd derosuite
