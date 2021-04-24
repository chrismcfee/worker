from partlab/ubuntu-golang
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN useradd -ms /bin/bash worker
USER worker
#RUN export PATH=$PATH:$(go env GOPATH)/bin
USER root
RUN mkdir -p /home/worker/derosrc/
RUN mkdir -p /home/worker/proj
COPY derosuite/ /home/worker/derosrc/
RUN cp -avr /home/worker/derosrc /home/worker/proj
RUN cd /home/worker/proj && ls -la 
USER root
#ADD . /opt/go/src/myapp
#RUN go get github.com/deroproject/derosuite RUN go install myapp
#RUN go install myapp

#ENTRYPOINT /opt/go/bin/myapp
EXPOSE 8080

#RUN cd derosuite
