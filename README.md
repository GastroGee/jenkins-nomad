# Jenkins Nomad Integration 
This Repo showcases Jenkins ability to spin up build agents on hashicorp's nomad cluster.

If you have a Nomad cluster in your environment, running Jenkins agents on the Nomad workers will give you good build isolation for different applications versions.

# How it works 
When a Jenkins job is triggered, the Jenkins nomad plugin will make an API call to the nomad cluster to spin up an agent, then the agent gets deployed in the nomad cluster with pre-specified environmental variables or configuration.

When the agent comes alive, it used the details in its environment variables which would include Jenkins controller information and talks back to Jenkins using the JNLP method.

# How to Use this 
Run 
```
sudo docker-compose up -d 
```
This should spin up a jenkins controller container and also a nomad server in development mode 

Jenkins is configured using its CASC Plugin so you pratically just get a full functional test environment 


