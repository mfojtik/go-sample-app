FROM google/golang
# Install docker to be able to build && push from the container
RUN mkdir -p /build && curl -sSL https://get.docker.com/ | sh
ADD ./hack/build.sh /build.sh
CMD ["/build.sh"]
