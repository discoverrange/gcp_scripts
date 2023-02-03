# gcp_ssh

GCP Cloud 

The script is executed using cloud shell in GCP

Before executing please configure the GCP project

```
gcloud config set project [PROJECT_ID] 
```

Using this script we will be able to execute commands remotely for n number of running linux instances present in a GCP project 


This script will skip to execute ssh command in terminated instances. And it maintains the skipped instances in /tmp/status.txt file

```
 gcloud compute ssh NAME --zone ZONE --command='EXECUTE-COMMAND' 
```


The above command establishes a ssh session with the mentioned instance and will execute the given command.




