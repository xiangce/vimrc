#!/bin/sh

GH_REPO_LIST="insights-core insights-plugins insights-cli insights-core-assets"
ALL_REPO_LIST="$GH_REPO_LIST diag-insights-rules insights-prodsec-rules support-rules"

for i in $GH_REPO_LIST; do
    if [ ! -d ./$i ]; then
        git clone git@github.com:RedHatInsights/$i.git
    fi
done

if [ ! -d 'support-rules' ]; then
    git clone git@gitlab.cee.redhat.com:support-insights/diag-insights-rules.git
fi
if [ ! -d 'diag-insights-rules' ]; then
    git clone git@gitlab.cee.redhat.com:insights-sd/diag-insights-rules.git
fi
if [ ! -d 'insights-prodsec-rules' ]; then
    git clone git@gitlab.cee.redhat.com:insights-open-source/insights-prodsec-rules.git
fi

for i in $ALL_REPO_LIST; do
    echo '-----------------------------------------------------'
    echo "$i ...."
    git --git-dir=./$i/.git --work-tree=./$i pull origin master
done
