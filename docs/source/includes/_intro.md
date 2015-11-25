# Introduction

*Developer documentation for the family of LCMAP clients*

[![][lcmap-logo]][lcmap-logo-large]

[lcmap-logo]: images/lcmap-logo-1-250px.png
[lcmap-logo-large]: images/lcmap-logo-1-1000px.png


The intent of the Land Change Monitoring Assessment and Projection (LCMAP) initiative is to enable analysis of a very large amount of continuously acquired data to understand historical trends, assess current states, and project future states at regular intervals.

The system capacity and functionality needed to support the magnitude of long-term time series analysis is expected to employ Earth data science, demanding highly specialized computing environments to execute large scale analysis.

# The Client Libraries

Due to the nature of the LCMAP initiative, the supporting infrastrucuture is diverse and multi-faceted. Development on the system is on-going and subject to a great deal of change.

However, we are creating client libraries early in the process, with the understanding that the overhead of maintaining a moving target is far out-weighed by the benefits of engaging with the science and development communities from the very beginning.

## REST Access with cRUL

There are two ways in which one may interact with the LCMAP system as a
client:
* Directly, accessing the REST resources with ``cURL``
* Client libraries

## Language Bindings

Of the latter, we plan to provide the following language support:

* Python <span class="status-initial-stages">[IN PROGRESS]</span>
* Julia <span class="status-not-started">[NOT STARTED]</span>
* Clojure <span class="status-in-progress">[IN PROGRESS]</span>

## Viewing Per-language Examples

All four approaches to client access are demonstrated in the following document. To view example code for any one of them, be sure to select the appropriate tab in the upper-right of the docuemtnation page.

<aside class="success">
The following API functions are ready to use:
<ul>
<li><code></code></li>
</ul>
</aside>

<aside class="caution">
Note that the following have not been tested extensively (or possibly at all)
against compliant servers:
<ul>
<li><code></code></li>
</ul>
</aside>

<aside class="danger">
Note that the following have not yet been implemented:
<ul>
<li><code></code></li>
</ul>
</aside>

