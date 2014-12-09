FROM google/golang
RUN mkdir -p /build && curl -sSL https://get.docker.com/ | sh
ADD ./hack/build.sh /build.sh
CMD ["/build.sh"]
