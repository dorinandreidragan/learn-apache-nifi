# Setting Up Apache NiFi

## System Requirements

Infrastructure

- Standalone
- Cluster

OS

- Windows
- Linux
- Unix
- Mac OS X

Prerequisites

- Java 8+

Browser

- Microsoft Edge
- Mozilla Firefox
- Google Chrome
- Safari

## Decisive System Characteristics

- CPU: Processing with the number of threads available and configure
- I/O: Performing read/write operations on disks
- RAM: Holding properties, attributes and content (when needed) in the configured memory size
- Network: Exchanging data between services, nodes or instances

## Sizing Recommendations

| Throughput per second (MB/events) | NiFi Nodes | CPU (Cores/node) | I/O (Disks/node) | RAM (Memory/node) | Network (NICs bonded) |
| --------------------------------- | ---------- | ---------------- | ---------------- | ----------------- | --------------------- |
| 50/1,000                          | 1          | 8+               | 6                | 4+ GB             | 1 GB                  |
| 100/10,000                        | 3          | 16+              | 6                | 8+ GB             | 1 GB                  |
| 500/100,000                       | 10         | 24+              | 12               | 16+ GB            | 10GB                  |

## Configuring and Tuning Apache NiFi

Configuration Files

- `nifi.properties`
  - Core and state
  - Repositories
  - Web
  - Cluster and Site-To-Site
  - Security
  - Zookeeper
- `zookeeper.properties`
  - Cluster mode
- `bootstrap.conf`
  - JVM and overall execution

Important settings

- `nifi.properties`
  
  ```bash
  # Core Properties
  nifi.bored.yield.duration=10 millis
  nifi.administrative.yield.duration=30 sec
  
  # FlowFile Repository
  nifi.queue.swap.threshold=20000

  # Provenance Repository
  nifi.provenance.repository.index.threads=2
  nifi.provenance.repository.index.shard.size=500 MB
  ```

- `bootstrap.conf`

  ```bash
  # JVM memory settings
  java.arg.2=-Xms512m
  java.arg.3=-Xms512m

  # Garbage Collection settings
  java.arg.13=-XX:+UseG1GC

  # Code cache settings
  java.arg.7=-XX:ReservedCodeCacheSize=256m
  java.arg.8=-XX:CodeCacheMinimumFreeSpace=10m
  java.arg.9=-XX:+UseCodeCacheFlushing
  ```

## Scaling Options in Apache NiFi

Scaling Options

- Scale-up Processor
- Scale-up Machine
- Scale-out (Clustering)

Apache NiFi Cluster Terminologies

- Primary Node - elected by Zookeeper and can run in Isolated Processors
- Cluster Coordinator - elected by Zookeeper and manages the cluster
- Cluster Node - performs actual data processing

## Configuration Tabs of a Processor

Settings

- Penalty & Yield duration
- Terminate relationship
- Logging bulletin

Schedule

- Scheduling settings
- Concurrent tasks
- Execution

Properties

- Processor-specific
- User-defined properties
- Refering to other components

Comments

## Connecting Processors

Predefined relationships

Routing data through one or more relationships

All relationships need to be set

Advanced configuration settings

- FlowFile Expiration
- Back Presure and Thresholds
- Prioritizers
- Load Balancing

## Controller Services

Services shared by components

Avaoid redundancy

Running encapsulated

Pre-built and custom controller services

Examples:

- Providing connections and credentials
- Sending reporting statistics
- Interpreting different data formats

## Apache NiFi Attributes and Expressions

Structore of a NiFi Expression

`${filename:equals('file')}`

## Demos

### Calling a REST API and Putting Data to Local Files

## Install with Podman

Make sure you have `podman` installed.

Running Apache NiFi on `http://localhost:8080/nifi`

```bash
  -p 8080:8080 \
  -d \
  apache/nifi:latest
```

Running Apache NiFi on `https://localhost:8443/nifi`

```bash
  -p 8443:8443 \
  -d \
  -e SINGLE_USER_CREDENTIALS_USERNAME=admin \
  -e SINGLE_USER_CREDENTIALS_PASSWORD=ctsBtRBKHRAx69EqUghvvgEvjnaLjFEB \
  apache/nifi:latest
```
