#!/bin/bash
TASK=`sudo aws ecs list-tasks --cluster PRODUCTION --service-name Demo_app --desired-status RUNNING --region us-east-2 --output text | awk '{print $2}'`
sudo aws ecs stop-task --cluster PRODUCTION --task $TASK --region us-east-2
echo "Task stopped successfully"
