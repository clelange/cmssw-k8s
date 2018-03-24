# CMSSW with kubernetes

The Docker containers used are based on https://github.com/clelange/cmssw-docker. The scripts currently use a predefined CMSSW version (CMSSW_9_4_4), which is set up when a pod is started. The pod receives a VOMS proxy via an [initContainer](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/). It then runs a data set query, and runs the [GenXSecAnalyzer](https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideSubgroupMC#Measure_filter_efficiencies_and) writing the output to a log file in `log/out.txt`. For details, see the [job configuration](cmssw-job.yaml).

## Prerequisites

To be able to access data sets via the grid, one needs to have a VOMS proxy. Whenever a pod is started, this proxy is automatically created from the kubernetes secrets. To create these secrets, make sure you have your `usercert.pem` and `userkey.pem` in the directory `~/.globus/`. Then do the following, replacing `GRIDPASS` with your certificate password.
```
mkdir secrets
 echo GRIDPASS > secrets/password.txt
./create_secret.sh
```

## Running jobs

To start a job, just do:
```
kubectl create -f cmssw-job.yaml
```
If this is a large data set, processing can take quite a while.

The scripts that are run can be found in the [scripts](scripts) directory.

## Monitoring

Some useful monitoring commands:
```
kubectl describe jobs/cmssw-job
pods=$(kubectl get pods --show-all --selector=job-name=cmssw-job -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
kubectl describe $pods
kubectl logs $pods
kubectl get pods --show-all
```
