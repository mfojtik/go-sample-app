all build:
	docker run --rm -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp golang:1.3 go build -ldflags '-s' -v
