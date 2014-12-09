go-sample-app
=============

This is an example of a Docker file that builds a static Go binary and create a
minimal Docker image from it. To execute this you can run:

```
$ docker pull mfojtik/mfojtik/go-sample-builder
$ docker run -v /var/run/docker.sock:/var/run/docker.sock --name myapp mfojtik/mfojtik/go-sample-builder
```

This command will produce the 'myapp' Docker image you can run using:

```
$ docker run -p 8080:8080 myapp
```

You might notice that the `myapp` Docker image has **~4MB**.
