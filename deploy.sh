#!/bin/bash
TASK=`sudo aws ecs list-tasks --cluster PRODUCTION --service-name Demo_app --desired-status RUNNING --region us-east-2 --output text --query taskArns`
if [[ -z $TASK ]]
then
echo "No tasks are running"

else
for task in `echo $TASK`
do
sudo aws ecs stop-task --region us-east-2 --cluster PRODUCTION --task $task

echo "Task stopped and updated sucessfully successfully"
done
fi
