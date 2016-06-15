# Development Environment

If you wish to develop client libraries for the LCMAP system, it may be more convenient to run a local instance of the development environment.

## Install Dependencies

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

## Get LCMAP Projects

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

## Load Sample Data

```bash
cd lcmap-data
make db-setup

# db-setup runs these three tasks
make db-schema
make db-specs
make db-tiles

```
Use the [lcmap-data](https://github.com/usgs-eros/lcmap-data) project to load a schema, tile-specs, and sample tile data. This loads a small (~60M) amount of Landsat 5/7 surface reflectance, top of atmosphere, and various indices during 2002-01-01/2002-12-31 covering an approximately four square kilometer area in Washington state.

See [lcmap-test-data](https://github.com/usgs-eros/lcmap-test-data) for more information.

## Start REST API

The `lcmap-system` project contains a make target to start the LCMAP REST API and a test authentication service.

```bash
# start the REST API and test authentication service
make run
```

At this point you may develop against the lcmap-rest services you have running locally.
