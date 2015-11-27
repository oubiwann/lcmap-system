# API: General

## Client Initialization

```shell
mkdir ~/.usgs
echo "alice" > cat ~/.usgs/username
echo "secret" > cat ~/.usgs/password
chmod 600 ~/.usgs/*
```

## Authentication

```shell
LCMAP_ENDPOINT=http://localhost:8080
LCMAP_TOKEN=$(curl -s -X POST \
  -H "Accept: application/vnd.usgs.lcmap.v0.0+json" \
  -d "username=`cat ~/.usgs/username`" \
  -d "password=`cat ~/.usgs/password`" \
  $LCMAP_ENDPOINT/api/auth/login | \
  jq -r '.token')
```
```shell
echo $LCMAP_TOKEN
3efc6475b5034309af00549a77b7a6e3
```

<aside class="info">
Remember, to authenticate against the LCMAP service you will need to have registered with the <a href="https://ers.cr.usgs.gov/login/">USGS ERS</a> service.
</aside>

<aside class="info">
To parse the JSON results from cURL via the command line, the <code>jq</code>  utility is being used. See the <a href="https://stedolan.github.io/jq/">jq site</a> for more details.
</aside>
