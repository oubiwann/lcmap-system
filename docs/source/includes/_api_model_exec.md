# API: Models

The LCMAP Science Execution Environment provides a highly parallel and scalable system to apply science models to batches and streams of data. The associated services have been designed for the ability to be distributed globally. The execution environment handles the efficient and fair scheduling of execution  science models in a widely distributed data-intensive environment.

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


## Sample: OS Process Model

> Execute the sample process model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
RESULT=`curl -s -X POST \
  -H "Accept: application/vnd.usgs.lcmap.v0.0+json" \
  -H "X-AuthToken: $LCMAP_TOKEN" \
  "$LCMAP_ENDPOINT/api/L3/sample/model?seconds=120&year=2017"`
RESULT_PATH=`echo $RESULT|jq -r '.result.link'`
echo $RESULT_PATH
/api/L3/sample/model/294e810de79155743efdcf71f0bf462e
```

> Check on the status of the model run:

```shell
curl -v ${LCMAP_ENDPOINT}${RESULT_PATH}
```

This sample model simply executes an arbitrary binary (in this case, the ``cal`` program) as an OS process on a single core.

## Sample: Docker Process Model

> Execute the sample Docker process model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
TBD
```

Similar in nature to the OS Process Sample Model, this sample model executes a model by running a single Docker container.


## Sample: Mesos Docker Model

> Execute the sample Docker Mesos model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
TBD
```

This sample model executes a Docker container across agent nodes in a Mesos cluster. Model parameters are split across a configurable number of nodes and results are combined in the final step of model execution.


## Sample: Mesos framework Model

> Execute the sample Mesos framework model for the year ``2017``, setting the results to delay for 2 minutes:

```shell
TBD
```

This sample model executes a Mesos framework which has been tuned to parallelize on both the science model parameters and the required queries to the data warehouse. It is this combination of factors which are used to split work across a configurable number of nodes. Results are combined in the final step of model execution.


## CONTINUOUS CHANGE DETECTION AND CLASSIFICATION

Continuous Change Detection and Classification (CCDC) is an algorithm for analyzing land cover using Landsat data. It is capable of detecting many kinds of land cover change continuously as new images are collected and providing land cover maps for any given time.

A two-step cloud, cloud shadow, and snow masking algorithm is used for eliminating "noisy" observations.

A time series model that has components of seasonality, trend, and break estimates surface reflectance and brightness temperature. The time series model is updated dynamically with newly acquired observations.

Due to the differences in spectral response for various kinds of land cover change, the CCDC algorithm uses a threshold derived from all seven Landsat bands. When the difference between observed and predicted images exceeds a threshold three consecutive times, a pixel is identified as land surface change.


## CCDC Execution

> Generate a CCDC model for the given extents, time-range, and ...:

```shell
TBD
```


## CCDC Results Storage

TBD


## CCDC Prediction

TBD
