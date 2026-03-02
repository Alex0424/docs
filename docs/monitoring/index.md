# Monitoring

## Tools

### Prometheus

- Runs as a monitoring server on a virtual machine, container, or bare metal
- Scrapes metrics from targets (using exporters)
- Collects metrics such as CPU usage, RAM usage, and disk I/O
- Stores time-series metrics in its own database

### Grafana Loki

- Collects and stores logs from applications and systems
- Designed to integrate with Prometheus-style labels
- Lightweight compared to ELK

### Grafana

- Connects to Prometheus as a data source (Metrics -> Prometheus -> Grafana)
- Connects to Loki as a data source (Logs -> Loki -> Grafana)
- Queries metrics from Prometheus
- Visualizes the metrics through dashboards
- Supports alerting (e.g.: email notification if CPU usage exceeds 80%)
