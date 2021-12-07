# Overview

## Introducing Apache NiFi

Apache NiFi is an easy to use, powerful, and reliable system to process and distribute data.

Top Key Features

- Flow management
- Push and pull models
- Ease of use
- Data provenance
- Security
- Extensible architecture
- Flexible in scaling

### Dataflow Management

![Dataflow Management](docs/resources/dataflow-management.png)

### Big Data Integration with Apache Nifi

Volume

- Cluster Setup
- Parallelism
- Custom settings

Velocity

- Asynchrony
- Data buffering
- Memory usage

Variety

- Pre-built components
- Custom components
- Many default formats

Veracity

- Tracking & Cleansing
- Repositories
- Guaranteed Delivery

### Apache NiFi as a Dataflow System

| Good For                            | NOT good for                                                  |
| ----------------------------------- | ------------------------------------------------------------- |
| Stream processing                   | Batch processing                                              |
| Data transfer and delivery          | Distributed computations                                      |
| Handling data-in-motion             | Handling huge bulks of data                                   |
| Routing, filtering and transforming | Complex event processing, joins and rolling window operations |

## Architecture and Core Concepts of Apache NiFi

### Mapping Concepts of Flow Based Programming to Apache NiFi

![Mapping FBP Terms to Apache NiFi](docs/resources/mapping-fbp-terms-to-apache-nifi.png)

| Flow-based     | Apache NiFi   |
| -------------- | ------------- |
| Black box      | Processor     |
| Scheduler      | Controller    |
| IP             | FlowFile      |
| Subnet         | Process Group |
| Bounded Buffer | Connection    |

### Apache NiFi's Environment and Architecture

![Apache NiFi Environment and Architecture](docs/resources/apache-nifi-environment-and-architecture.png)

### Apache NiFi Main Components

![Apache NiFi Main Components](docs/resources/apace-nifi-main-components.png)

#### FlowFile

- Creation and adding content
- Data chunk moving through the system
- Attributes
  - System and user-defined attributes
  - Metadata in key/value pairs
- Content
  - Pointing to actual data
  - Data stored in Content Repository

#### Processor

![Processor Component](docs/resources/processor-component.png)

- Configurable component written in Java
- Accessing attributes and content of FlowFiles and performing operations
- High-level abstraction fulfilling a task
- 300 pre-built processors available in 1.9
- Development of custom processors
- Individual scaling configurations

#### Process Groups

![Process Groups](docs/resources/process-group-component.png)

- Grouping and nesting processors and their connections
- Interacting with other layers
- Defining input and output ports
- Beneficial in maintaining flows

#### Connections

![Connection Component](docs/resources/connections-component.png)

- Connecting processors and process groups
- Queuing and buffering between processors
- Defining threshold and applying backpressure
- Prioritizing FlowFiles (default FIFO)

#### Controller

![Controller Component](docs/resources/controller-component.png)

- The brain of the operation
- Managing dataflow
- Keeping record of all applied components
- Allocating and managing threads
- Adding services for sharing resources among processors
  - Database connections
  - SSL certificates

### FlowFile Lifecycle and Repositories

![FlowFile Lifecycle and Repositories](docs/resources/flowfile-lifecycle-and-repositories.png)

### Clustering Apache NiFi

![Apache NiFi Cluster Setup](docs/resources/apache-nifi-cluster-setup.png)

## Environments

### VM

Prerequisites:

- Vagrant
- VirtualBox
- Vagrant Plugins

    ```bash
    vagrant plugin install vagrant-docker-compose
    ```

## References

[Running Nifi in a Docker Container](https://nathanlabadie.com/running-nifi-in-a-docker-container/)

[Using volumes with rootles podman, explained](https://www.tutorialworks.com/podman-rootless-volumes/)