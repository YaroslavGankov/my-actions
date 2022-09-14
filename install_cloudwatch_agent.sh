#!/bin/bash
#script installs CloudWatchAgent to EC2-Instance and configure it. This script for amazon linux
sudo yum -y update
sudo yum install -y amazon-ssm-agent
sudo yum install -y amazon-cloudwatch-agent
sudo systemctl enable amazon-ssm-agent
sudo systemctl enable amazon-cloudwatch-agent

#Подготовка для переопределения конфигурации и перезапуска агента
#почему-то не создаётся директория, поэтому создаём её
sudo mkdir /usr/share/collectd/
#зачем-то нужен файл, создаём его
sudo touch /usr/share/collectd/types.db

#restart cloudwatch agent with new configuration
#-a - command fetch-config
#-m - apply for ec2
#-s - restart after configuring (used for fetch-config)
#-c - configuration-file (can be ssm:<parameter-store-name>, file:<path>)
sudo amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c ssm:AmazonCloudWatch-linux


#ПРИМЕРЫ, НЕ РАСКОММЕНТИРОВАТЬ
# Пример блока logs в конфигурационном файле для агента:
# "logs": {
# 		"logs_collected": {
# 			"files": {
# 				"collect_list": [
# 					{
# 						"file_path": "/var/log/httpd/access_log",
# 						"log_group_name": "access_log",
# 						"log_stream_name": "{instance_id}",
# 						"retention_in_days": -1
# 					},
# 					{
# 						"file_path": "/var/log/httpd/error_log",
# 						"log_group_name": "error_log",
# 						"log_stream_name": "{instance_id}",
# 						"retention_in_days": -1
# 					}
# 				]
# 			}
# 		}
# 	},
