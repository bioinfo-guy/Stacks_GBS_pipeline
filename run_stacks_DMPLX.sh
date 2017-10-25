#!/bin/bash
#PBS -M [your email]
#PBS -m abe
#PBS -N ST_KBPlate4
#PBS -l nodes=1:ppn=16
#PBS -q default
#PBS -j oe
#PBS -o /PATH/TO/Stacks/JOBS/Stacks4.out

############
# Variables
############
# qsub -N ST_KBPlate1 -o /PATH/TO/Stacks/JOBS/DMPLX1.out -v "PLATENAME="KBPlate1"" run_stacks_DMPLX.sh
# PLATENAME="KBPlate4"
RUNDIR="/PATH/TO/Stacks/"
READSDIR="/PATH/TO/Stacks/READS"
OUTDIR="/PATH/TO/Stacks/PROC_READS6/"
BCDIR="/PATH/TO/Stacks/Barcodes_files/"
LOCALDIR="/state/partition1/"

################
# Create OUTDIR
################

if [ ! -d "$OUTDIR" ]; then
    mkdir $OUTDIR
fi

if [ ! -d "$OUTDIR$PLATENAME" ]; then
    mkdir $OUTDIR$PLATENAME
fi

###################
# Create local dir
###################

rm -rf $LOCALDIR$PLATENAME

if [ ! -d "$LOCALDIR$PLATENAME" ]; then
    mkdir $LOCALDIR$PLATENAME
fi

#############################
# Copy fastq.gz to local dir
#############################

cd $READSDIR

cp *$PLATENAME* $LOCALDIR$PLATENAME

###################
# Run demultiplex
###################

# Need to export due to GCC 6.1.0
export PATH LD_LIBRARY_PATH
PATH=/share/programs/gcc/6.1.0/bin/:$PATH
echo $LD_LIBRARY_PATH
LD_LIBRARY_PATH=/share/programs/gcc/6.1.0/lib/:/share/programs/gcc/6.1.0/lib64/:$LD_LIBRARY_PATH 


~/programs/stacks/stacks-1.40/process_radtags -t 90 -i gzfastq -p $LOCALDIR$PLATENAME -o $OUTDIR$PLATENAME -b $BCDIR/$PLATENAME.txt --renz_1 mspI  --renz_2 pstI --adapter_1 CCTACACGACGCTCTTCCGATCT -E phred33 -r -c -q --disable_rad_check
# ~/programs/stacks/bin/process_radtags -t 90 -i gzfastq -p $LOCALDIR$PLATENAME -o $OUTDIR$PLATENAME -b $BCDIR/$PLATENAME.txt --renz_1 mspI  --renz_2 pstI --adapter_1 CCTACACGACGCTCTTCCGATCT -E phred33 -r -c -q --disable_rad_check
# ~/programs/stacks/bin/process_radtags -i gzfastq -p $LOCALDIR$PLATENAME -o $OUTDIR$PLATENAME -b $BCDIR/$PLATENAME.txt --renz_1 mspI  --renz_2 pstI -E phred33 -r -c -q --disable_rad_check
rm -rf $LOCALDIR$PLATENAME
