source /opt/cms/cmsset_default.sh
scramv1 project CMSSW ${CMSSW_VERSION}
cd ${CMSSW_VERSION}/src
eval `scramv1 runtime -sh`
