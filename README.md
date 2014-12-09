go-sample-app
=============

This is an example of a Docker file that builds a static Go binary and create a
minimal Docker image from it. To execute this you can run:

```
$ socket=/var/run/docker.sock
$ docker pull mfojtik/go-sample-builder
$ docker run -v $socket:$socket mfojtik/go-sample-builder
```

This command will produce the '172.121.17.3:5001/openshift/origin-go-sample' Docker image,
you can verify it using:

```
$ docker images | grep origin-go-sample
```

(don't worry about the '172.121.17.3:5001', it is just sample Docker registry name)

```
$ docker run -p 8080:8080 172.121.17.3:5001/openshift/origin-go-sample
```

You might notice that the resulting Docker image has **~4MB**.
