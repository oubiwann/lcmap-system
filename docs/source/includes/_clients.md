# The Client Libraries

## Language Bindings & Status

> Development status of your client:

```shell
cURL Status: IN PROGRESS
```

```python
Python Status: INITIAL STAGES
```

```vb
Julia Status: INITIAL STAGES
```

```clojure
Clojure Status: IN PROGRESS
```

```ruby
Ruby Status: NOT STARTED
```

We plan to provide the following client libraries for LCMAP:

* Python <span class="status-initial-stages">[INITIAL STAGES]</span>
* Julia <span class="status-initial-stages">[INITIAL STAGES]</span>
* Clojure <span class="status-in-progress">[IN PROGRESS]</span>
* Ruby <span class="status-not-started">[NOT STARTED]</span>


## Viewing Per-language Examples

cURL and client access are demonstrated in the following document while using the same prose for describing the overall experience.

To view example code for any one of the language-specific libraries, be sure to select the appropriate tab in the upper-right of this documentation site.


## Installation

> Install your client with the following:

```shell
# cURL installation is OS-dependent. For Ubuntu command-line:
sudo apt-get install curl
```

```python
# Until the LCMAP Python client library is released in PyPI, use git:
git clone git@github.com:USGS-EROS/lcmap-client-py.git
```

```vb
git clone git@github.com:USGS-EROS/lcmap-client-jl.git
ln -s lcmap-client-jl ~/.julia/v0.4/LCMAPClient
```

```clojure
;; Until the LCMAP Clojure client library is released in Clojars, use git:
git clone git@github.com:USGS-EROS/lcmap-client-clj.git
```

```ruby
# There's not currently a Ruby client repo
```

Installation is dependent upon the client you want to use. How cURL gets installed is dependent upon your operating system , development platform, and/or package manager.

The client library installations each have their own method of installation. See the notes to the right for per-language details.


## Configuration

Default user configuration should be saved in an LCMAP configuration file. Values stored here may be overridden by setting specific environment variables in your system shell.


### Config/INI File

> Set up your username and password.

```shell
mkdir ~/.usgs
echo "alice" > cat ~/.usgs/username
echo "secret" > cat ~/.usgs/password
```

> The ``~/.usgs/lcmap.ini`` is used by client libraries (but not cURL) to access user-configurable data. Here is a sample configuration:

```ini
[LCMAP Client]
username = alice
password = secret
```

> For the testing auth server you can use "alice" as the username and "secret" as the password. For accessing the production LCMAP service, you will use your [USGS ERS](https://ers.cr.usgs.gov/login/) credentials

```
```

> Be sure to protect your configuration files, especially if they contain sensitive information:

```
chmod 600 ~/.usgs/*
```

All the LCMAP client libraries use the same ``~/.usgs/lcmap.ini`` configuration file and the same format (Config/INI). In particular, data that is applicable to LCMAP clients is stored in the ``LCMAP Client`` section of this configuration file.

Currently, the following keys are defined for the ``LCMAP Client`` section:

* ``username`` - your ERS username
* ``password`` - your ERS password
* ``version`` - version of the REST service you wish to use (server-side)
* ``endppoint`` - base URL of the REST service (if other than production)
* ``content-type`` - override the default content type of returned data
* ``log-level`` - verbosity of logged output (most verbose to least: ``all``, ``trace``, ``debug``, ``info``, ``warn``, ``error``, and ``none``)
* ``logging-namespaces`` - space-separated namespaces to log

The values for the username and password keys are used to obtain the LCMAP token from an authentication server (both the production ERS server and the testing server provided in ``lcmap-rest/test/aupport/auth-server``).

Each client library provides a sample ``lcmap.ini`` which you may use to create your own. To esaily set up your own, simply do: ``cp examples/lcmap.ini ~/.usgs/lcmap.ini``. You will need to update the ERS username and password, though!

<aside class="caution">
cURL is a special case, being a command line tool. It doesn't use the <code>~/usgs/lcmap.ini</code> file, rather it can be used to <code>cat</code> plain text files.
</aside>


### ENV Variables

Environment variable are also supported. They offer an easy and standard way to override configured defaults. The following environment variables are defined for LCMAP:

* ``LCMAP_USERNAME``
* ``LCMAP_PASSWORD``
* ``LCMAP_VERSION``
* ``LCMAP_ENDPOINT``
* ``LCMAP_CONTENT_TYPE``
* ``LCMAP_LOG_LEVEL``
* ``LCMAP_LOGGING_NAMESPACES``

Note that defining any one these will override the corresponding value in ``~/.usgs/lcmap.ini``.
