# Development Environment

If you wish to develop client libraries for the LCMAP system, it may be more convenient to run a local instance of the development environment.

## Installing Dependencies

Developers using Ubuntu 14.04 can run ``make install`` to install the following:

```bash
make install
```

* GDAL 1.11.2
* Leiningen 2
* Oracle Java 8
* Python 3
* Ruby 1.9.3
* Apache Cassandra 2.1.14
* Apache Mesos 0.28.2
* Marathon
* Chronos
* Apache Zookeeper
* RabbitMQ 3.2.4
* Docker 1.11
* NGINX 1.4.6

### Web Consoles

Following installation of the above dependencies, these administrative consoles should be running.

* [Mesos](http://localhost:5050/)
* [Marathon](http://localhost:8080/)
* [Chronos](http://localhost:4400/)
* [RabbitMQ](http://localhost:15672/) (guest/guest)

## Getting LCMAP Projects

```bash

# Optional, but recommended.
export LCMAP_HOME="$HOME/Projects/lcmap"
export CDPATH="$CDPATH:$LCMAP_HOME"

# Uses git to clone lcmap-* repositories
make clone
```

Download LCMAP project by running ``make clone``. Set `LCMAP_HOME` environment variable to override the default ``~/Projects/lcmap`` location.

* lcmap-client-clj
* lcmap-client-py
* lcmap-config
* lcmap-data
* lcmap-dockerfiles
* lcmap-event
* lcmap-logger
* lcmap-rest
* lcmap-see
* lcmap-model-wrapper

## Startup

```bash
cd lcmap-data && make db-setup
cd lcmap-rest && make test-auth-server
cd lcmap-rest && make run
```

### Initialize the DB:

* Load lcmap-data schema, tile-specs, and sample tile data: ``cd lcmap-data && make db-setup``

### Start the REST API:

* Start lcmap-rest test auth service: ``cd lcmap-rest && make test-auth-server``
* Start lcmap-rest suite of services: ``cd lcmap-rest && make run``

At this point you may develop against the lcmap-rest services you have running locally.
