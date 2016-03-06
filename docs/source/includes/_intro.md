# Introduction

*System Deployment Documentation for LCMAP*

[![][lcmap-logo]][lcmap-logo-large]

[lcmap-logo]: images/lcmap-logo-1-250px.png
[lcmap-logo-large]: images/lcmap-logo-1-1000px.png


## About LCMAP

The intent of the Land Change Monitoring Assessment and Projection (LCMAP) initiative is to enable analysis of a very large amount of continuously acquired data to understand historical trends, assess current states, and project future states at regular intervals.

The system capacity and functionality needed to support the magnitude of long-term time series analysis is expected to employ Earth data science, demanding highly specialized computing environments to execute large scale analysis.


### Land Change

Land-change science is about understanding changes in the type, intensity, condition, and location of land use and cover as indications of possible impacts to and from the interactions between people and nature.

Toward this aim, the LCMAP system's goals are to:

1. Provide users and science models with direct access to a vast amount of Analysis Ready Data.

1. Assess and project changes to land cover, use, and condition.

1. Provide science users the means to continuously monitor and classify changes.

1. Support decision making relevant to environmental management and policy.

1. Enable discovery and distribution of information derived by science models through many channels, to many user communities.


### System Architecture

The system architecture and the components of which it is comprised has been designed to fulfill the LCMAP science user experience:

1. Access and Exploration - enables discovery, visualization, reporting, notification, and other access methods via REST resources and GIS standards for services and file formats.

1. Subscription and notification services - allows science users to continuously monitor land change data for events of particular interest.

1. Science Execution Environment (SEE) - enables rapid development, production, validation and deployment of science models.

1. Information Warehouse and Data Store - contains decades of Analysis Ready Data as well as new data as it is obtained from satellites and science model outputs.

1. Client Libraries, Documentation, and Tutorials - enable science users to automate the collection and processing of land change data and develop new science models.


## The REST Service

Since the LCMAP system service provides REST resource over HTTP, all of the client libraries are essentially wrappers around HTTP client libraries. To provide the best possible developer experience, these libraries strive to handle configuration, cumbersom tasks, or multiple calls as cleanly as possible with as little direct intervention on the part of the user as makes good, clean sense.


## Users and Roles

In order to use the LCMAP service, you need to be authenticated as a value user. To do this, you will need to register an account with the [USGS ERS](https://ers.cr.usgs.gov/login/) service (or use an existing one). Registration is simple and only takes a few seconds. After submitting your registration and verifying your email address, you will be ready to use the LCMAP REST service.


## Important Developer Notes

That being said, there are key things every developer should keep in mind, in order to better understand how the LCMAP service and its associated libraries work. This will aide in better code and provide the proper background in the event that debugging becomes necessary in your project.

Important things to note and remember:

* There is no version number in the URL; the version is passed in an ``Accept``
  header.
* File extensions in a query string (e.g., ``/some-resource?xml``) are not
  used to determine the content type; this is done using headers (``Accept``
  and ``Content-Type``).
* An authentication token is used in place of an API key; this is handled for
  you automatically as soon as you have logged in to the USGS authentication
  service.


## Conventions

We use styled call-outs to provide immediate visual cues about the nature of
the information being shared.

These are as follows:

<aside class="info">
This style indicates useful information, background, or other insights.
</aside>

<aside class="success">
This style indicates a best practice, good usage, and other tips for success.
</aside>

<aside class="caution">
This style indicates one should use caution or that behaviour may not be as
expected
</aside>

<aside class="danger">
This style indicates information that could cause errors if ignored.
</aside>


## API Organization

The LCMAP REST service and client APIs have been organized into several key areas:

* **General** calls such as client initialization and user authentication
* **Querying** calls such as for Analysis Ready Data (ARD) or previous results from executing supported science models
* **Subscription** calls related to services for notifying users of subscribed land-change events
* **Model Execution** calls such as performing runs to build model data based on previous stored data or making predictions based on previous model runs
* **Management** calls such as system status, maintaining users, and modifying roles

Each of these is discussed in more detail below.


