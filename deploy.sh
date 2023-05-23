#!/bin/bash
TASK=`sudo aws ecs list-tasks --cluster QAt2 --service-name Demo_app --desired-status RUNNING --region us-east-2 --output text | awk '{print $2}'`
sudo aws ecs stop-task --region us-east-2 --cluster QAt2 --task $TASK
echo "Task stopped successfully"
