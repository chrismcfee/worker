from ubuntu
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
#RUN apt-get -y install golang
#RUN apt-get -y install software-properties-common 
#RUN apt-get -y install gpg
#RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt-get -y update
RUN apt-get -y install gnupg2
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F6BC817356A3D45E
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install tzdata
RUN apt-get -y install golang-go
RUN go version
RUN useradd -ms /bin/bash worker
RUN chown -R worker:worker /home/worker/
USER worker
RUN echo im worker now
#RUN export PATH=$PATH:$(go env GOPATH)/bin
USER root
RUN echo im root now
RUN mkdir -p /home/worker/derosrc/
RUN mkdir -p /home/worker/proj
COPY derosuite/ /home/worker/derosrc/
RUN cp -avr /home/worker/derosrc /home/worker/proj
RUN cd /home/worker/proj && ls -la && cd derosrc/ && ls -la
USER root
RUN echo im root now
USER worker 
RUN echo im worker now
RUN mkdir /home/worker/gop
RUN export GOROOT=/usr/local/go
RUN export GOPATH=/home/worker/gop
RUN export PATH="$GOPATH/bin:$PATH"
RUN . ~/.bashrc
USER root
RUN echo im root
USER worker
RUN echo im worker
RUN export GOROOT=/usr/local/go
RUN export GOPATH=/home/worker/gop
RUN export PATH="$GOPATH/bin:$PATH"
RUN . ~/.bashrc
#ADD . /opt/go/src/myapp
USER root
RUN mkdir -p /root/goroot/
RUN mkdir -p /root/gopath/
#RUN mkdir -p 
RUN export GOROOT=/root/goroot/
RUN export GOPATH=/home/gopath/
RUN export PATH="$GOPATH/bin:$PATH"
RUN . ~/.bashrc
#RUN go get github.com/deroproject/derosuite
RUN chown -R worker:worker /home/worker/
#RUN chown -R worker:worker /usr/local/go
RUN chown -R worker:worker /root/.go
USER worker
#RUN go install myapp
RUN echo we are almost ready to start!
USER root
RUN echo im root again now
RUN go get -u github.com/deroproject/derosuite/cmd/dero-miner
RUN cd /home/worker/proj/derosrc/ && chmod +x build_all.sh && ./build_all.sh
#RUN go get -d github.com/deroproject/derosuite
#ENTRYPOINT /opt/go/bin/myapp
EXPOSE 8080
#RUN cd derosuite
