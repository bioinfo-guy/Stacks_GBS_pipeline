# Stacks GBS pipeline
A set of job submission scripts to run STACKS (http://catchenlab.life.illinois.edu/stacks/) on a computer cluster with TORQUE/MAUI scheduler. 
#Motivation
All the files were used to generate GBS data analyses published on the manuscript "Markers associated to host plant and host related strains and the genetic structure of Brazilian populations of Spodoptera frugiperda (Lepidoptera, Noctuidae)" submitted for publication.
#License
All the files are available under Attribution-ShareAlike 2.0 license and, please, read https://creativecommons.org/licenses/by-sa/2.0/ if you want to use them.

#FILE DESCRIPTIONS

-- ALL_stacks_run.sh
All commands used to run STACKS

-- command.Stacks.sh
Run denovo_map.pl non interactive

-- create_ustacks_mean_coverage.txt.sh
Create USTACKS mean coverage file

-- cstacks_run.sh
Non interative scritp to run CSTACKS.

-- run_CSTACKS_by_hand2.sh
TORQUE job file to run CSTACKS. Must run with qsub -t 1-[number of individuals] option. It will distribute the execution among all available nodes.

-- run_population_by_hand2.sh
TORQUE job file to run POPULATIONS. You might edit few POPULATIONS parameters within the file.

-- run_SSTACKS_by_hand2.sh
TORQUE job file to run SSTACKS. Must run with qsub -t 1-[number of populations] option. It will distribute the execution among all available nodes.

-- run_stacks_DMPLX.sh
TORQUE job file to run process_radtags, set the variable PLATENAME to the plate you are using, this might help you to send execution of different plates to the available nodes.
qsub -N ST_KBPlate1 -o /PATH/TO/Stacks/JOBS/DMPLX1.out -v "PLATENAME="KBPlate1"" run_stacks_DMPLX.sh

-- run_stacks.sh
TORQUE job file to run stacks non interactive.

-- run_structure2.sh
TORQUE job file to run structure (https://web.stanford.edu/group/pritchardlab/structure.html) on a cluster.
Use qsub -t 1-[number of k to be used] run_structure2.sh. Edit the 'E' parameter, line 15, to set the number of replicates

-- run_USTACKS_by_hand2.sh
TORQUE job file to run USTACKS. Must run with qsub -t 1-[number of fastq files] option. It will distribute the execution among all available nodes.

-- STACKS_trabalhando.sh
CSTACKS and SSTACKS bash script.
At the end run POPULATIONS. There is also an bash script to gather stacks size

-- ustacks_run.sh
Run USTACKS, one by one, automated using bash.
