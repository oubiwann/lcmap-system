# Development Environment

If you wish to develop client libraries for the LCMAP system, it may be more convenient to run a local instance of the development environment.

## Installing Dependencies

Developers using Ubuntu 14.04 can run ``make install`` to install the following:

* GDAL 1.11.2
* Leiningen 2
* Oracle Java 8
* Python 3
* Ruby 1.9.3
* Apache Cassandra 2.1.14
* Apache Mesos 0.28.2
* Apache Zookeeper
* RabbitMQ 3.2.4
* Docker 1.11
* NGINX 1.4.6

TODO:

* Provide local development configuration files for each of these services.

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

* Load lcmap-data schema, tile-specs, and sample tile data: ``cd lcmap-data && make db-setup``

### Start the REST API:

* Start lcmap-rest test auth service: ``cd lcmap-rest/test/support/auth-server && lein run``
* Start lcmap-rest suite of services: ``cd lcmap-rest && lein with-profile dev run``

At this point you may develop against the lcmap-rest services you have running locally.
