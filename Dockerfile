from partlab/ubuntu-golang
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
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
#RUN cd /home/worker/proj/derosrc/ && chmod +x build_all.sh && ./build_all.sh
RUN go get -u -v -d github.com/deroproject/derosuite
#ENTRYPOINT /opt/go/bin/myapp
EXPOSE 8080
#RUN cd derosuite
