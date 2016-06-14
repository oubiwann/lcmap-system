# Development Environment

If you wish to develop client libraries for the LCMAP system, it may be more convenient to run a local instance of the development environment. Developers using Ubuntu 14.04 can run ``make install-deps`` to install libraries and binaries:

* GDAL 1.11.2
* Leiningen 2
* Python 3
* Oracle Java 8
* Ruby 2.0

The following services are installed, but *not started* by default. This project provides default configurations for each and shell scripts for launching these process (TODO).

* Apache Cassandra 2.1.14: ``cassandra/start``
* Apache Mesos 0.28.2 (TODO)
* RabbitMQ 3.2.4 (TODO)
* Docker 1.11 (TODO)
* NGINX 1.4.6 (TODO)

## Projects

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

* Copy sample lcmap.ini config: ``make lcmap.ini``
* Start Cassandra: ``cassandra/start``
* Load lcmap-data schema and sample data: ``cd lcmap-data && make setup``
* Start testing auth service: ``cd lcmap-rest/test/support/auth-server && lein run``
* Start lcmap-rest suite of services: ``cd lcmap-rest && lein with-profile dev run``

At this point you may develop against the lcmap-rest services you have running locally.
