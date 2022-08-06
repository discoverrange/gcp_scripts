# gcp_ssh

GCP Cloud 

The script is executed using cloud shell in GCP

Before executing please configure the GCP project

<i> gcloud config set project [PROJECT_ID] </i>

Using this script we will be able to execute commands remotely for n number of running linux instances present in a GCP project 
This script will skip to execute commands in terminated instances. 

<i> gcloud compute ssh NAME --zone ZONE --command='EXECUTE-COMMAND' </i>
The above command establishes a ssh session with the mentioned instance and will execute the given command.




