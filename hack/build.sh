#!/bin/bash -e

IMAGE_NAME="openshift/origin-go-sample"
TARGET_IMAGE="172.121.17.3:5001/${IMAGE_NAME}:prod"

pushd /build >/dev/null
CGO_ENABLED=0 go get -a -ldflags '-s' github.com/mfojtik/go-sample-app
tar cv /gopath/bin/go-sample-app | docker import - scratch
cat > Dockerfile <<- EOF
FROM scratch
EXPOSE 8080
ENTRYPOINT ["/gopath/bin/go-sample-app"]
EOF
docker build -t ${IMAGE_NAME} .
docker tag ${IMAGE_NAME} ${TARGET_IMAGE}
docker push ${TARGET_IMAGE}
popd >/dev/null
