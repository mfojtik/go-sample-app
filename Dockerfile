FROM google/golang
ADD ./hack/build.sh /build.sh
ENTRYPOINT ["/build.sh"]
