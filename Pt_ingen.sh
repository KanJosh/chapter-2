#!/bin/sh
####################################################

NAME='sc'

####################################################

for LAT in 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0
do
cat > Pt.$NAME.${LAT}-scf.in << EOF
 &control
    calculation = 'scf',
    verbosity = 'high'
    prefix = 'Pt.$NAME'
 /
 &system
    ibrav = 1, 
    A = $LAT, 
    nat =  1, 
    ntyp = 1,
    ecutwfc = 40.0,
    ecutrho = 450.0,
    occupations = 'smearing',
    smearing = 'marzari-vanderbilt',
    degauss = 0.02
 /
 &electrons
    mixing_beta = 0.7
 /

ATOMIC_SPECIES
 
Pt 195.084000  Pt.pbe-n-rrkjus_psl.1.0.0.UPF

ATOMIC_POSITIONS (alat)
 Pt 0.0 0.0 0.0

K_POINTS (automatic)
 16 16 16 1 1 1
EOF

done

