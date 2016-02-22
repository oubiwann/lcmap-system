# API: General

## Client Initialization


```shell
LCMAP_ENDPOINT=http://localhost:1077
LCMAP_VERSION_HDR="Accept: application/vnd.usgs.lcmap.v0.0+json"
```

```python
from lcmap.client import Client
client = Client()

# This will read your ERS username and password from ENV variables or
# the lcmap.ini configuration file and authenticate against the LCMAP service.
# It uses the Requests library's session management and keep-alive
# functionality in subsequent calls.

# Upon successful instantiation, the auth component will be populated with the
# user login data
client.auth
{'email': 'alice@usgs.gov',
 'roles': ['RPUBLIC', 'LANDSAT8CUST'],
 'token': '3efc6475b5034309af00549a77b7a6e3',
 'user-id': '001010111',
 'username': 'alice'}
```

```vb
TBD
```

```clojure
(require '[lcmap.client.core :as lcmap])
(def client (lcmap/connect))

; This will read your ERS username and password from ENV variables or
; the lcmap.ini configuration file, authenticate against the LCMAP service,
; and then create a client connection pool that will be used in subsequent
; requests to the LCMAP service.

; Note that the connect function's return vallue is used in all subsequent
; client function calls.
```

```ruby
TBD
```

The degree to which client libraries perform an initialization setp varies from language to language. cURL, by virtue of it being a command line utility, is pretty open-ended; we use ``ENV`` variables to "initialize" it. While functional programming languages like Clojure don't typically have the concept of objects, specialized data structures are used, and these need to be set up ahead of time. Client libraries for object-oriented languages such as Python and Ruby do typical object instantiation during this step.


## Authentication

> Manual authentication will return user data:

```shell
LCMAP_USER_DATA=$(curl -s -X POST -H "$LCMAP_VERSION_HDR" \
  -d "username=`cat ~/.usgs/username`" \
  -d "password=`cat ~/.usgs/password`" \
  $LCMAP_ENDPOINT/api/auth/login)
```

```python
# The Python client automatically logs you in upon instantiation, so there is
# generally no need to manually authenticate.

# However, should you ever wish to do so, you may call the following method:
client.auth.login(username="alice", password="secret")
{'email': 'alice@usgs.gov',
 'roles': ['RPUBLIC', 'LANDSAT8CUST'],
 'token': '3efc6475b5034309af00549a77b7a6e3',
 'user-id': '001010111',
 'username': 'alice'}

```

```vb
TBD
```

```clojure
; The client connection function automatically authenticates you, so there
; is generally no need to manually call an authentication function when using
; the Clojure LCMAP client library.

; Should you ever wish to do so, you may call the following:
(require '[lcmap.client.auth :as auth])
(auth/login :username "alice" :password "secret")
{:user-id "001010111",
 :username "alice",
 :roles ["RPUBLIC" "LANDSAT8CUST"],
 :email "alice@usgs.gov",
 :token "3efc6475b5034309af00549a77b7a6e3"}
```

```ruby
TBD
```

In LCMAP, the process of authentication (for most clients, this is done automatically), returns metadata for the authenticated user. This includes such data as an API token, a user id, a username, the primary email address for the ERS account, and the roles the user has been granted via ERS and LCMAP.

<aside class="info">
Remember, to authenticate against the LCMAP service you will need to have registered with the <a href="https://ers.cr.usgs.gov/login/">USGS ERS</a> service.
</aside>


## User Data

> Get the token value:

```shell
LCMAP_TOKEN=$(echo $LCMAP_USER_DATA | \
  jq -r '.result.token')
echo $LCMAP_TOKEN
3efc6475b5034309af00549a77b7a6e3

# For subsequent cURL commands, we'll need the HTTP X-AuthToken header
# to be set; we can define that now that we have the token value:
LCMAP_TOKEN_HDR="X-AuthToken: $LCMAP_TOKEN"
```

```python
client.auth.get_token()
u'3efc6475b5034309af00549a77b7a6e3'
```

```vb
TBD
```

```clojure
(require '[lcmap.client.auth :as auth])
(auth/get-token client)
"3efc6475b5034309af00549a77b7a6e3"
```

```ruby
TBD
```

> Get the username value:

```shell
echo $LCMAP_USER_DATA | \
  jq -r '.result.username'
alice
```

```python
client.auth.get_username()
u'alice'
```

```vb
TBD
```

```clojure
(auth/get-username client)
"alice"
```

```ruby
TBD
```

> Get the roles:

```shell
echo $LCMAP_USER_DATA | \
  jq -r '.result.roles'
[
  "RPUBLIC",
  "LANDSAT8CUST"
]
```

```python
client.auth.get_roles()
[u'RPUBLIC', u'LANDSAT8CUST']
```

```vb
TBD
```

```clojure
(auth/get-roles client)
["RPUBLIC" "LANDSAT8CUST"]
```

```ruby
TBD
```

> Get the primary email address:

```shell
echo $LCMAP_USER_DATA | \
  jq -r '.result.email'
alice@usgs.gov
```

```python
client.auth.get_email()
u'alice@usgs.gov'
```

```vb
TBD
```

```clojure
(auth/get-email client)
"alice@usgs.gov"
```

```ruby
TBD
```

> Get the user-id value:

```shell
echo $LCMAP_USER_DATA | \
  jq -r '.result."user-id"'
001010111
```

```python
client.auth.get_userid()
u'001010111'
```

```vb
TBD
```

```clojure
(auth/get-userid client)
"001010111"
```

```ruby
TBD
```

The following user data is made available by the LCMAP clients:

* API token
* ERS username
* ERS and LCMAP roles for the user
* ERS primary email address
* ERS user id


<aside class="info">
To parse the JSON results from cURL via the command line, the <code>jq</code>  utility is being used. See the <a href="https://stedolan.github.io/jq/">jq site</a> for more details.
</aside>

