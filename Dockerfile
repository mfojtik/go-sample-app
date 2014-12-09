FROM google/golang
ADD ./hack/build.sh /build.sh
RUN mkdir -p /build
ENTRYPOINT ["/build.sh"]
