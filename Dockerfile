FROM golang:1.15

RUN go get -u -v github.com/kardianos/govendor

WORKDIR $GOPATH/src/github.com/nenoteerawat/kafka-health-check
COPY . $GOPATH/src/github.com/nenoteerawat/kafka-health-check

RUN make deps && make
RUN cp ./kafka-health-check /usr/bin/kafka-health-check && chmod a+x /usr/bin/kafka-health-check

CMD ["./entrypoint.sh"]