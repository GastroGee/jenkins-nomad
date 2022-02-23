#Jenkins Nomad Agent
--------------------

This is just a docker image that would be spun up by Nomad for the Jenkins controller to run build jobs. The Nomad agent here is built as docker-in-docker because in my environment my builds require docker themselves. Agents can come in all flavors but the most basic requirement for Jenkins is that we have JRE installed because the agent will need to communicate back with the jenkins controller using the JNLP method

## Usage
--------

```
docker build -t jenkins-nomad-worker .
```
The nomad cloud can then be configured in Jenkins to use this image when it spins up build agents in Nomad
