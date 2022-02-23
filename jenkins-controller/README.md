# Jenkins Controller
-------------------
Jenkins is a self-contained, open source automation server which can be used to automate all sorts of tasks related to building, testing, and delivering or deploying software. We attempt to dockerize our jenkins controller with pre-determined plugins.

## Usage
-------

The plugins.yaml file contains a list of plugins to be installed in the Jenkins Image. If you do have more plugins; you can add them to the file (preferably with pinned versions)

## To Build
-----------
```
docker build -t jenkins-controller .
```

## To Run
--------
```
docker run -p 8080:8080 -p 50000:50000 jenkins-controller
```

This will store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuration. You will probably want to make that an explicit volume so you can manage it and attach to another container for upgrades :

```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins-controller
```

