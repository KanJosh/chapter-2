# chapter-2

Create a test directory on SPORC using the mkdir command:
 mkdir {test_directory}
 Use scp or an ftp client like FileZilla to transfer the tarred file (qe_demo.tar) to the
test directory:
 scp qe_demo.tar your_username@sporcsubmit.rc.rit.edu:~/{test_directory}
 Extract files from folder using the tar command:
 tar –xvf qe_demo.tar
 List the files in your test directory using the ls command:
 ls –la
 The four files which will be extracted are as follows:
 QE Input File Generator Script: Pt_ingen.sh
 Pseudopotential File: Pt.pbe-n-rrkjus_psl.1.0.0.UPF
 Shell Script: scf_loop.sh
 SLURM Job Script: slurm_scf_loop.sh

Step 2 

 You can inspect the configuration
file by using shell commands or
the vi editor:
 To open file in vi editor: enter
vi Pt_ingen.sh
 To close vi editor: enter :q!
 To see the top ten lines of file:
enter head Pt_ingen.sh
 To see the ten bottom lines:
enter tail Pt_ingen.sh
 To generate the QE input files
enter bash Pt_ingen.sh
 There should be ten additional
files in the test directory
named “Pt.sc.2.{x}-scf.in”

Step 3
 Rename the generated input files by
repeatedly entering the following
command:
 mv Pt.sc.2.{x}-scf.in Pt.sc.{x}-scf.in
 Display entire contents of the first
input file:
 cat Pt.sc.1-scf.in
 You should access the QE Input File
Description webpage to get more
details on the input data format…

Step 4
 You can inspect the file using the commands given in the previous slides
 Be careful NOT to change the contents of this file!
 Return to your home directory:
 cd ~
 Create a directory for the pseudopotential file:
 mkdir qe_potentials
 Move file from test directory to the qe_potentials directory:
 mv {test_directory}/Pt.pbe-n-rrkjus_psl.1.0.0.UPF qe_potentials
 List files in the qe_potentials directory to confirm it was moved
 ls qe_potentials
 Return to your test directory
 cd {test_directory}

Step 5
 The scf_loop.sh file submits the ten batch jobs to the SLURM job scheduler
 Display entire contents of the file:
 cat scf_loop.sh

Step 6
 Open the slurm job script in the vi editor:
 enter vi slurm_scf_loop.sh
 Edit the file by typing i
 move your cursor to the end of the line using the up/down/left/right arrow
keys and backspace until you remove unwanted text
 Type desired text; hit the ESC key
 Save the file by typing :wq

Step 7
 Execute job by typing the following at a command prompt
 bash scf_loop.sh (or ./scf_loop.sh)
 You can check the status of the job by entering
 squeue –u {your_username}
 Once the job is completed, you should have several additional files and a folder
(containing data saved from the calculation) in your test directory:
 Job Output Files: Pt.sc.{x}-scf.o
 Logging information during execution is written here…
 Job Error Files: Pt.sc.{x}-scf.e
 Any errors during execution will be written here

Step 8
 Explore the output file for the first job with the vi editor (see below for a portion
of the file):
 vi Pt.sc.1-scf.o
 Close by typing :q!

step 9

 Extract the total energy from all of the job output files using the following
command at a bash prompt:
 grep ! Pt.sc.*-scf.o > Pt.sc.energies.txt
 To show the contents of the file enter cat Pt.sc.energies.txt
 Export the data to MS Excel or similar data plotting software application
 Note that the minimum energy for the Pt simple cubic structure occurs for a
lattice constant of 2.6 Å

step 10

 Perform additional self-consistent calculations for platinum in the following
lattices and associated parameters:
 Face-centered cubic lattice with lattice constant a from 3.5 Å to 4.4 Å in 0.1
Å increments
 Hexagonal close-packed lattice with the following lattice parameters:
 a from 3.3 Å to 4.2 Å in 0.1 Å increments
 c/a from 1.5 Å to 2.0 Å in 0.25 Å increments
 Based on your results, which of the three lattice structures is preferred by
platinum?
 Compare your DFT-predicted lattice parameter(s) of the preferred structure
to experimental observations

