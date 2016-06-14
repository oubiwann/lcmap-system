# Development Environment

If you wish to develop client libraries for the LCMAP system, it may be more convenient to run a local instance of the development environment. Developers using Ubuntu 14.04 can run ``make install-deps`` to install libraries and binaries:

* GDAL 1.11.2
* Leiningen 2
* Python 3
* Oracle Java 8
* Ruby 2.0

The following services are installed and started. This project provides default configurations for each and shell scripts for launching these process (TODO).

* Apache Cassandra 2.1.14
* Apache Mesos 0.28.2
* Apache Zookeeper
* RabbitMQ 3.2.4
* Docker 1.11
* NGINX 1.4.6

## Getting LCMAP Projects

Download LCMAP project by running ``make clone-projects``. Set `LCMAP_HOME` environment variable to override the default ``~/Projects/lcmap`` location.

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

The LCMAP project provides a default configuration for Cassandra that isolates data and logs to this project directory.

### Initialize the DB:

* Load lcmap-data schema: ``cd lcmap-data && make schema``
* Load sample data: ``cd lcmap-data && make sample``

### Start the REST API:

* Start lcmap-rest test auth service: ``cd lcmap-rest/test/support/auth-server && lein run``
* Start lcmap-rest suite of services: ``cd lcmap-rest && lein with-profile dev run``

At this point you may develop against the lcmap-rest services you have running locally.
