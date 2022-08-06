#!/bin/bash -v
  for instance in $(gcloud compute instances list --format='value[separator=","](status,name)');  do
    s="${instance%,*}";  #instance status
    n="${instance#*,}";  #instance name
    z="$(gcloud compute instances list --filter="name:$n" --format='value(zone)')"
    zone=$z; #instance zone
    echo "GCP"
    echo "Instance Name:" $n >>list_instance.txt   #storing total instance list 
    echo "Instance Name:" $n 
    echo "Instance Status:" $s 
    echo "Instance Zone:" $zone
   
      if [ $s == "RUNNING" ] #checking instance status 
        then 
            agent_status="$(gcloud compute ssh $n --zone $zone --command='systemctl is-active [AGENT_SERVICE]') " # add your agent service here to check the status
            if [ $agent_status == "active" ] #checking agent status
            then
                printf "Agent already installed\n\n "
            else 
                printf "Installation started \n"
                gcloud compute ssh $n --zone $zone --command=" [ COMMAND ] " #add your agent installation command
                printf "Completed Agent\n\n" 
            fi
        else
            printf "\n\n"
            echo "Agent Status: Skipped as instance is teminated:" $n >> /tmp/status.txt  #storing skipped instances
        fi
 done
