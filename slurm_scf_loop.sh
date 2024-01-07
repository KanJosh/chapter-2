#!/bin/bash -l
# NOTE the -l flag!
#

#SBATCH --mail-user oxuche@rit.edu
#SBATCH --mail-type=ALL

#SBATCH -t 0-5:0:0

#SBATCH -A 2dptheory -p tier3 -n 1

#SBATCH --mem=100g

export ESPRESSO_PSEUDO=/home/oxuche/qe_potentials
echo $ESPRESSO_PSEUDO

srun -n 1 pw.x < ${jobname}.in
mv ${jobname}.o ../
mv ${jobname}.e ../
cd ..
rm -r ${jobname}
