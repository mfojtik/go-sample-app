#!/bin/sh -e

IMAGE_NAME="openshift/origin-go-sample"
TARGET_IMAGE="172.121.17.3:5001/${IMAGE_NAME}:prod"

pushd /build >/dev/null
CGO_ENABLED=0 go get -a -ldflags '-s' github.com/mfojtik/go-sample-app
cat > Dockerfile <<- EOF
FROM scratch
ADD /gopath/bin/go-sample-app /app
EXPOSE 8080
ENTRYPOINT ["/app"]
EOF
docker build -t ${IMAGE_NAME} .
docker tag ${IMAGE_NAME} ${TARGET_IMAGE}
docker push ${TARGET_IMAGE}
popd >/dev/null
