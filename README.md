# jmeter-datadog

A containerized environment for executing Apache JMeter performance tests with integrated Datadog monitoring. This setup facilitates the collection and visualization of test metrics within the Datadog platform.

## Features

* **Dockerized Testing Environment**: Simplifies the setup and execution of JMeter tests.
* **Datadog Integration**: Enables real-time monitoring and analysis of performance metrics in Datadog.
* **Automated Scripts**: Includes shell scripts for building the Docker image and running tests.

## Prerequisites

* Docker installed on your system.
* A valid Datadog API key.
* Apache JMeter test plan files (`.jmx`).

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/charlescasemiro/jmeter-datadog.git
cd jmeter-datadog
```

### Build the Docker Image

Execute the build script to create the Docker image:

```bash
./build.sh
```

### Run JMeter Tests

To execute a JMeter test plan:

```bash
./test.sh <path_to_test_plan.jmx>
```

To run the test in the background:

```bash
nohup ./test.sh <path_to_test_plan.jmx> &
```

## Configuration

Ensure that the Datadog Backend Listener plugin is included in your JMeter test plan. Configure the listener with the following parameters:

* **Backend Listener Implementation**: `org.datadog.jmeter.plugins.DatadogBackendClient`
* **Parameters**:

  * `apiKey`: Your Datadog API key.
  * `datadogUrl`: (Optional) Datadog API URL. Default is `https://api.datadoghq.com/api/`.
  * `logIntakeUrl`: (Optional) Datadog log intake URL. Default is `https://http-intake.logs.datadoghq.com/v1/input/`.
  * `metricsMaxBatchSize`: (Optional) Maximum number of metrics per batch. Default is `200`.
  * `logsBatchSize`: (Optional) Maximum number of logs per batch. Default is `500`.
  * `sendResultsAsLogs`: (Optional) Set to `true` to send individual test results as logs.
  * `includeSubresults`: (Optional) Set to `true` to include subresults.
  * `excludeLogsResponseCodeRegex`: (Optional) Regex to exclude certain response codes from logs.
  * `samplersRegex`: (Optional) Regex to filter samplers to monitor.
  * `customTags`: (Optional) Comma-separated list of tags to add to every metric.

For detailed configuration options, refer to the [Datadog JMeter Backend Listener documentation](https://docs.datadoghq.com/integrations/jmeter/).

## Scripts Overview

* `build.sh`: Builds the Docker image.
* `test.sh`: Executes the specified JMeter test plan.
* `run.sh`: (Optional) Additional script for running tests.
* `entrypoint.sh`: Entry point script for the Docker container.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
