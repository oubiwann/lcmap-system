# API: Management

<aside class="caution">
Only users with the superuser role may make management calls to the LCMAP services.
</aside>


## Status

> Get the current system status:

```shell
$ STATUS_JSON=$(curl -s -X GET \
    -H "$LCMAP_VERSION_HDR" -H "$LCMAP_TOKEN_HDR" \
    "${LCMAP_ENDPOINT}/api/system/json-status")
$ echo $STATUS_JSON|jq  -r '.status.jvm.memory'
{
  "free": "1091048952",
  "total": "1402994688",
  "max": "0"
}
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

> Get the system status in the format expected by JMeter (Tomcat-compatible):

```shell
$ STATUS_XML=$(curl -s -X GET \
    -H "$LCMAP_VERSION_HDR" -H "$LCMAP_TOKEN_HDR" \
    "${LCMAP_ENDPOINT}/api/system/status")
$ echo $STATUS_XML
<?xml version="1.0" encoding="UTF-8"?>
<status>
  <jvm>
    <memory free="993846000" total="1400897536" max="0"></memory>
    ...
  </jvm>
</status>
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


## Permissions


## Roles


## Users
