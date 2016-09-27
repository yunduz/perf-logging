#!/bin/sh

java -cp $HOME/repos/synoptic/lib/*:$HOME/repos/synoptic/synoptic/bin/ synoptic.main.SynopticMain --dumpInvariants=true --dumpInitialPartitionGraph=true --noRefinement=true --noCoarsening=true --outputCountLabels=true --outputProbLabels=false -c $HOME/repos/perf-logging/trace-processing/log-args.txt -o ./$@  $@
