#!/bin/bash

set -x -e -u -o pipefail

wget -q https://s3.eu-central-1.amazonaws.com/amazoncloudwatch-agent-eu-central-1/debian/amd64/latest/amazon-cloudwatch-agent.deb
dpkg -i -E ./amazon-cloudwatch-agent.deb

cat <<EOF > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
{
  "agent": {
    "metrics_collection_interval": 60,
    "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
  },
  "metrics": {
    "namespace": "${product}/${service}-${environment}",
    "metrics_collected": {
      "cpu": {
        "measurement": [
          "cpu_usage_idle", 
          "cpu_usage_nice",
          "cpu_usage_guest"
        ]
      },
      "disk": {
        "ignore_file_system_types": [ "sysfs", "devtmpfs", "squashfs", "tmpfs" ],
        "measurement": [
          {"name": "free", "unit": "Gigabytes"},
          "total",
          "used"
        ]
      },
      "diskio": {
        "resources": [ "*" ],
        "measurement": [
          "reads",
          "writes",
          "read_time",
          "write_time",
          "io_time"
        ]
      },
      "swap": {
        "measurement": [
          "swap_used",
          "swap_free",
          "swap_used_percent"
        ]
      },
      "mem": {
        "measurement": [
          "mem_used",
          "mem_cached",
          "mem_total"
        ]
      },
      "net": {
        "resources": [
          "eth0"
        ],
        "measurement": [
          "bytes_sent",
          "bytes_recv",
          "drop_in",
          "drop_out"
        ]
      },
      "netstat": {
        "measurement": [
          "tcp_established",
          "tcp_syn_sent",
          "tcp_close"
        ]
      },
      "processes": {
        "measurement": [
          "running",
          "sleeping",
          "dead"
        ]
      }
    }
  },
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log",
            "log_group_name": "${prefix}",
            "log_stream_name": "amazon-cloudwatch-agent.log",
            "timezone": "UTC"
          },
          {
            "file_path": "/opt/aws/amazon-cloudwatch-agent/logs/test.log",
            "log_group_name": "test.log",
            "log_stream_name": "test.log",
            "timezone": "Local"
          }
        ]
      }
    },
    "log_stream_name": "my_log_stream_name",
    "force_flush_interval" : 15
  }
}
EOF
systemctl start amazon-cloudwatch-agent

${additional_user_data}

