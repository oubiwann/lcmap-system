# API: General

## Client Initialization


```shell
LCMAP_ENDPOINT=http://localhost:8080
LCMAP_VERSION_HDR="Accept: application/vnd.usgs.lcmap.v0.0+json"
```

```python
TBD
```

```vb
TBD
```

```clojure
TBD
```

```ruby
TBD
```

## Authentication

> Authenticate to obtain an API token:

```shell
LCMAP_TOKEN=$(curl -s -X POST -H "$LCMAP_VERSION" \
  -d "username=`cat ~/.usgs/username`" \
  -d "password=`cat ~/.usgs/password`" \
  $LCMAP_ENDPOINT/api/auth/login | \
  jq -r '.token')
LCMAP_TOKEN_HDR="X-AuthToken: $LCMAP_TOKEN"
```

```python
TBD
```

```vb
TBD
```

```clojure
(require '[lcmap-client.auth :as auth])
(def user-data (auth/login :username "alice" :password "secret"))
#'user-data
;; To use configured values or environment variables, simply make the call with
;; no arguments:
(def user-data (auth/login))
```

```ruby
TBD
```

> Check the token value:

```shell
echo $LCMAP_TOKEN
3efc6475b5034309af00549a77b7a6e3
```

```python
TBD
```

```vb
TBD
```

```clojure
(:token user-data)
"3efc6475b5034309af00549a77b7a6e3"
```

```ruby
TBD
```

<aside class="info">
Remember, to authenticate against the LCMAP service you will need to have registered with the <a href="https://ers.cr.usgs.gov/login/">USGS ERS</a> service.
</aside>

<aside class="info">
To parse the JSON results from cURL via the command line, the <code>jq</code>  utility is being used. See the <a href="https://stedolan.github.io/jq/">jq site</a> for more details.
</aside>
