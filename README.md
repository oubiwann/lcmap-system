# lcmap-client-docs

*Developer documentation for the family of LCMAP clients*

[![][lcmap-logo]][lcmap-logo-large]

[lcmap-logo]: resources/images/lcmap-logo-1-250px.png
[lcmap-logo-large]: resources/images/lcmap-logo-1-1000px.png

##### Table of Contents

* [About](#about-)
* [Development](#development-)

## About [&#x219F;](#table-of-contents)

This is the source for the LCMAP client library documentation site:
 * [http://usgs-eros.github.io/lcmap-client-docs/current/](http://usgs-eros.github.io/lcmap-client-docs/current/)

All supported client libraries are documented there.

This docs site utilizes [TripIt's Slate project](https://github.com/tripit/slate).


## Development [&#x219F;](#table-of-contents)

If you will be working on the LCMAP client docs locally or publishing changes
to the Github docs site for LCMAP, you will need to have the appropraite tools
installed on your system. You will need the following:

* Ruby
* Ruby gems

With those installed, you can set up all the other dependencies with the
following:

```bash
$ make setup
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
