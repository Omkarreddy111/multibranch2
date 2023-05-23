#!/bin/bash
TASK=`sudo aws ecs list-tasks --cluster QAt2 --service-name Demo_app --desired-status RUNNING --region us-east-2 --output text | awk '{print $2}'`
if [[ -z $TASK ]]
then
echo "No tasks are running"
sudo aws ecs update-service --region us-east-2 --cluster QAt2 --service Demo_app --force-new-deployment
else
sudo aws ecs stop-task --region us-east-2 --cluster QAt2 --task $TASK
sudo aws ecs update-service --region us-east-2 --cluster QAt2 --service Demo_app --force-new-deployment
echo "Task stopped and updated sucessfully successfully"
fi
