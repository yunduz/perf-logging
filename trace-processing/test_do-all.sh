#!/bin/bash

BUILD_DIR=${HOME}/dinamite/llvm-3.5.0.src/projects/dinamite

if [ -z ${SCRIPTS_HOME} ]; then
    SCRIPTS_HOME=${HOME}/repos/perf-logging/trace-processing
fi

for file in "$@";
do
    echo Working on file ${file}
    ${HOME}/datamancers-bintrace-toolkit-4941d75a26e4/trace_parser -p print -a ac_short -m ${BUILD_DIR} ${file} | ${SCRIPTS_HOME}/process-logs.py --prefix ${file} > ${file}.txt.summary
    ${SCRIPTS_HOME}/timing_to_synoptic.py ${file}.txt
    ${SCRIPTS_HOME}/run-synoptic.sh ${file}.txt.synoptic
    ${SCRIPTS_HOME}/prettify-dotfiles.py ${file}.txt
    dot -Tpng ${file}.txt.synoptic-enhanced.dot > ${file}.png
done

rm *.synoptic.condensed*