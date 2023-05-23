#!/bin/bash
TASK=`sudo aws ecs list-tasks --cluster PRODUCTION --service-name Demo_app --desired-status RUNNING --region us-east-2 --output text | awk '{print $2}'`
if [[ -z $TASK ]]
then
echo "No tasks are running"
else
sudo aws ecs stop-task --region us-east-2 --cluster PRODUCTION --task $TASK
echo "Task stopped successfully"
fi
