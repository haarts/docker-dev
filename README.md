This repo will build a development for OpenTransactions.

The theory is _very_ simple:

Run tests etc *inside* the docker container. And
edit your source in the fuzzy comfort of the host system.

# Usage

Build it:
```shell
$ sudo docker build -t SOME_NAME .
```

Run it:
```shell
$ sudo docker run -i -t -v $GOPATH/src/github.com/monetas/:/opt/go/src/github.com/moneta SOME_NAME
```

