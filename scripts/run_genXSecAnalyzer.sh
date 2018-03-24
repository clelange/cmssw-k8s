#!/bin/sh
FILES=files.txt
# append comma to end except last line:
sed -i '$!s/$/,/' $FILES
# prepend prefix for all lines:
sed -i 's|^|file:root://cmsxrootd.fnal.gov//|' $FILES
cmsRun /home/cmsbld/scripts/genXSecAnalyzer.py maxEvents=-1 inputFiles="$(cat files.txt)"
# cmsRun /home/cmsbld/scripts/genXSecAnalyzer.py maxEvents=-1 inputFiles="file:root://cmsxrootd.fnal.gov///store/mc/RunIIFall17MiniAOD/WJetsToQQ_HT400to600_TuneCP5_13TeV-madgraphMLM-pythia8/MINIAODSIM/94X_mc2017_realistic_v10-v1/80000/3CDB3422-E314-E811-B481-0CC47A7C3610.root"
