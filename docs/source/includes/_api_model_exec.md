# API: Models

The LCMAP Science Execution Environment provides a highly parallel and scalable system to apply science models to batches and streams of data. The associated services have been designed for the ability to be distributed globally. The execution environment handles the efficient and fair scheduling of execution  science models in a widely distributed data-intensive environment.

The supported models to-date are the following:

* Sample models:
 * OS process model <span class="status-alpha">[ALPHA]</span>
 * Docker process model <span class="status-initial-stages">[INITIAL STAGES]</span>
 * Mesos Docker model <span class="status-not-started">[NOT STARTED]</span>
 * Mesos framework model <span class="status-not-started">[NOT STARTED]</span>
* Continuous Change Detection and Classification (CCDC) <span class="status-initial-stages">[INITIAL STAGES]</span>

## Model Execution

### Sample: OS Process Model

This sample model simply executes as an OS process on a single core.

### Sample: Docker Process Model

Similar in nature to the OS Process Sample Model, this sample model executes a model by running a single Docker container.

TBD


### Sample: Mesos Docker model

This sample model executes a Docker container across agent nodes in a Mesos cluster. Model parameters are split across a configurable number of nodes and results are combined in the final step of model execution.

TBD


### Sample: Mesos framework model

This sample model executes a Mesos framework which has been tuned to parallelize on both the science model parameters and the required queries to the data warehouse. It is this combination of factors which are used to split work across a configurable number of nodes. Results are combined in the final step of model execution.

TBD


### Continuous Change Detection and Classification

Continuous Change Detection and Classification (CCDC) is an algorithm for analyzing land cover using Landsat data

TBD


## Results Storage

TBD


## Model Prediction

TBD
