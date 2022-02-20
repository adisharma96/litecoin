# Litecoin 0.18.1 in Docker
This repository contains everything that you need to run Litecoin in Docker and Kubernetes with a simple Jenkins Pipeline script.

## Requirements
- Docker - your Jenkins server needs to have docker binary installed
- kubectl - it should be also available in your Jenkins server
- kubeconfig - separated config for your cluster must be located in ~/.kube/ directory of your Jenkins server (if you are using single kubeconfig you need to edit [Jenkinsfile](https://github.com/adisharma96/litecoin/blob/master/Jenkinsfile#L27) addinf `--context NAME_OF_CONTEXT` in this repository )


## Dockerfile
Multistage build is picked up as approach. The main reason for this is because I do not want to have everything installed during the build process in the image which will run in Kubernetes. The first image (packager) is built with the single RUN approach. It is because the version of the Litecoin is not going to be change and I am not going to persist different layers for cache purposes. Using `sha256sum -c` will fail the whole build process if return error. The same will apply for running `python3 shasum.py`.

Build it on your computer - `docker build -t litecoin:0.18.1 .`

## statefulset.yaml
Prerequisites
- `storageClassName: gp` created
-  'physical volume: mysql-01' created

## Jenkinsfile
This is a very simple Jenkinsfile using Groovy DSL. You need to specify:
- repository
- branch
- full image name (change USERNAME with yours) 
  - `USERNAME/litecoin` - for docker hub

Please read the Requirements section for additional information about the kubeconfig customizations.

## Text Manipulation problem: Using awk to print the ip address and hostname of your computer ##
All commands are in a bash script: ip.sh ###
I have solved the same using python3 code as well in the python3.6 script. 
Along with that there are some extra awk commands that i have used to format the output of cat /etc/passwd command making it much more easy to read.
awk.sh ---> formats output of cat /etc/passwd command.

##### Terraform #########
Having no significant experience with Terraform, I tried to solve the problem as much as possible.
Kindly go through the file #### terraform_modules.txt #####
