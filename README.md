# lcmap-system

*Administrator Documentation for LCMAP System Demployment*

[![][lcmap-logo]][lcmap-logo-large]

[lcmap-logo]: resources/images/lcmap-logo-1-250px.png
[lcmap-logo-large]: resources/images/lcmap-logo-1-1000px.png

##### Table of Contents

* [About](#about-)
* [Development](#development-)

## About [&#x219F;](#table-of-contents)

This is the source for the LCMAP System documentation site:
 * [http://usgs-eros.github.io/lcmap-system/current/](http://usgs-eros.github.io/lcmap-system/current/)

The means by which one deploys the LCMAP system are documented there.

This docs site utilizes [TripIt's Slate project](https://github.com/tripit/slate).


## Development [&#x219F;](#table-of-contents)

If you will be working on the LCMAP system docs locally or publishing changes
to the Github docs site for LCMAP, you will need to have the appropraite tools
installed on your system. You will need the following:

* Ruby
* Ruby gems

With those installed, you can set up this project's dependencies with the
following:

```bash
$ make setup-docs
```

This will install Ruby Bundler and then Slate's dependencies.

To run the development web server (serving content locally) while update the
docs, you may do the following:

```bash
$ make devdocs
```

Once complete, you may publish with this target:

```bash
$ make publish
```

## LCMAP Dev. Environment [&#x219F;](#table-of-contents)

If you will be working on other LCMAP system components. You can  Ubuntu 14.04 development environment with the following:

```bash
export LCMAP_HOME="$HOME/Projects/lcmap"
export CDPATH="$CDPATH:$LCMAP_HOME"
make setup-deps
make clone
```

With LCMAP system dependencies installed, you can bootstrap DB like so:

```bash
cd lcmap-data && make db-setup && cd-
```

Finally, you can launch the LCMAP REST API and an authentication service:

```bash
make run
```
