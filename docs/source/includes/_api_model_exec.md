# API: Models

The LCMAP Science Execution Environment provides a highly parallel and scalable system to apply science models to batches and streams of data. The associated services have been designed for the ability to be distributed globally. The execution environment handles the efficient and fair scheduling of execution  science models in a widely distributed data-intensive environment.



<aside class="info">
All of the models return a hypermedia link immediately, adhering to the principles of [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS).
</aside>

The supported models to-date are the following:

* Sample models:
 * OS process model <span class="status-alpha">[ALPHA]</span>
 * Docker process model <span class="status-initial-stages">[INITIAL STAGES]</span>
 * Mesos Docker model <span class="status-not-started">[NOT STARTED]</span>
 * Mesos framework model <span class="status-not-started">[NOT STARTED]</span>
* Continuous Change Detection and Classification (CCDC) <span class="status-initial-stages">[INITIAL STAGES]</span>


## SAMPLE MODELS

<aside class="caution">
In order to execute models on the LCMAP system, you have to have been granted permission to do so for the specific model in question.
</aside>


## &bull; Sample: OS Process Model

> Execute the sample process model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
RESULT_PATH=$(curl -s -X POST \
  -H "$LCMAP_VERSION_HDR" -H "$LCMAP_TOKEN_HDR" \
  -d "seconds=120" -d "year=2017" \
  "${LCMAP_ENDPOINT}/api/models/sample/os-process" | \
  jq -r '.result.link.href')
echo $RESULT_PATH
/api/jobs/sample/os-process/439ae2866a39bb5cbbe934583bfef114
```

```python
TBD
```

```vb
TBD
```

```clojure
(require '[lcmap-client.models.sample-os-process :as sample-model])
(sample-model/run :token token :year 2017 :delay 120 :version)
{:result {:link {:href "/api/jobs/sample/os-process/088c2b351ef64cdf820ab93bc1db8527"}}}
;; XXX Add function for following links: (lcmap-client/follow-link result)
```

```ruby
TBD
```

> Check on the status of the model run:

```shell
curl -v -H "$LCMAP_VERSION_HDR" -H "$LCMAP_TOKEN_HDR" \
  "${LCMAP_ENDPOINT}${RESULT_PATH}"
...
< HTTP/1.1 202 Accepted
...
{"result":"pending"}
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

> After the job has finished, ``GET``ing the result resource will return actual data:

```shell
curl -v -H "$LCMAP_VERSION_HDR" -H "$LCMAP_TOKEN_HDR" \
  "${LCMAP_ENDPOINT}${RESULT_PATH}"
...
< HTTP/1.1 200 OK
...
{"result":"                             2017\n\n
  ...}
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

This sample model simply executes an arbitrary binary (in this case, the ``cal`` program) as an OS process on a single core.

<aside class="info">
Note that subsequent calls with the same parameters will return immediately, since the results are automatically stored in the database and checked before executing a model.
</aside>


## &bull; Sample: Docker Process Model

> Execute the sample Docker process model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
TBD
```

Similar in nature to the OS Process Sample Model, this sample model executes a model by running a single Docker container.


## &bull; Sample: Mesos Docker Model

> Execute the sample Docker Mesos model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
TBD
```

This sample model executes a Docker container across agent nodes in a Mesos cluster. Model parameters are split across a configurable number of nodes and results are combined in the final step of model execution.


## &bull; Sample: Mesos Framework Model

> Execute the sample Mesos framework model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
TBD
```

This sample model executes a Mesos framework which has been tuned to parallelize on both the science model parameters and the required queries to the data warehouse. It is this combination of factors which are used to split work across a configurable number of nodes. Results are combined in the final step of model execution.


## CONTINUOUS CHANGE DETECTION AND CLASSIFICATION

Continuous Change Detection and Classification (CCDC) is an algorithm for analyzing land cover using Landsat data. It is capable of detecting many kinds of land cover change continuously as new images are collected and providing land cover maps for any given time.

A two-step cloud, cloud shadow, and snow masking algorithm is used for eliminating "noisy" observations.

A time series model that has components of seasonality, trend, and break estimates surface reflectance and brightness temperature. The time series model is updated dynamically with newly acquired observations.

Due to the differences in spectral response for various kinds of land cover change, the CCDC algorithm uses a threshold derived from all seven Landsat bands. When the difference between observed and predicted images exceeds a threshold six consecutive times, a pixel is identified as land surface change.


## &bull; CCDC Execution

> Generate a CCDC model for the given extents, time-range, and ...:

```shell
TBD
```


## &bull; CCDC Results Storage

TBD


## &bull; CCDC Prediction

TBD
