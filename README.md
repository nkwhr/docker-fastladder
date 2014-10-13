docker-fastladder
===========

## Description

Automated Build Dockerfile for [Fastladder](https://github.com/fastladder/fastladder).

Built Docker image can be download by `docker pull nkwhr/fastladder`.


See [Docker Hub](https://registry.hub.docker.com/u/nkwhr/fastladder/) for more information.

## Usage

### Run Fastladder with MySQL

There's a sample script to start/stop Fastladder with MySQL. Data will be permanently stored in `docker-fastladder/data` by default.

```
$ git clone https://github.com/nkwhr/docker-fastladder
$ cd docker-fastladder
```

Edit `MYSQL_PASSWORD` in start.sh.

```
$ vi start.sh
```

```
$ ./start.sh
=> Starting fastladder_db: e4e5238248334974a9102a7d9657262b2f04122a7f9db912d1ae6463bd19240e
=> Starting fastladder_web: f498422a4df90f903582559157d3704c158f6fcb52e035fc6c614966c5dfab68
```

```
$ ./stop.sh
=> Stopping: fastladder_web
=> Removing: fastladder_web
=> Stopping: fastladder_db
=> Removing: fastladder_db
```
