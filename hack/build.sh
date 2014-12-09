#!/bin/bash -e

# TODO: To make this generic Go static builder image we need to populate these
#       vars from the $BUILD variable, passed from the CustomBuilder.
#
GO_SOURCE="github.com/mfojtik/go-sample-app"
GO_BINARY="go-sample-app"
IMAGE_NAME="openshift/origin-go-sample"
IMAGE_TAG="prod"
TARGET_IMAGE="172.121.17.3:5001/${IMAGE_NAME}:${IMAGE_TAG}"

pushd /build >/dev/null
# Build a static Go binary and create minimal Docker image from it
CGO_ENABLED=0 go get -a -ldflags '-s' ${GO_SOURCE}
(cd /gopath/bin && tar cv ${GO_BINARY}) | docker import - ${IMAGE_INAME}-scratch

# The final image Dockerfile
cat > Dockerfile <<- EOF
FROM ${IMAGE_INAME}-scratch
EXPOSE 8080
CMD ["${GO_BINARY}"]
EOF

# Assemble the final scratch image, remove the temporary scratch image and push
# to registry.
docker build -t ${TARGET_IMAGE} .
docker rmi ${IMAGE_NAME}-scratch
docker push ${TARGET_IMAGE}
popd >/dev/null
