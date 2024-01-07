#!/bin/bash
#

prefix="Pt.sc"
jobfile="slurm_scf_loop.sh"

param_limit_alpha=10

# Loop and submit all the jobs
echo
echo " * Getting ready to submit a number of jobs:"
echo
for alpha in $(seq 1 $param_limit_alpha); do

	jobname=${prefix}.${alpha}-scf
	outfile=${prefix}.${alpha}-scf.o
	errfile=${prefix}.${alpha}-scf.e

        mkdir ${jobname}
        cp ${jobname}.in ${jobname}
        cp ${jobfile} ${jobname}
        cd ${jobname}
        	
	echo "Submitting job $jobname"

	export jobname;
	
	sbatch -J $jobname -o $outfile -e $errfile $jobfile

        cd ..
done
