#!/bin/bash
#PBS -M brandao.marcelo@gmail.com
#PBS -m abe
#PBS -l nodes=1:ppn=16
#PBS -l walltime=350:00:00
#PBS -N POPULATIONS
#PBS -q default
#PBS -j oe
#PBS -o /share/thunderstorm/users/mmbrand/Karina/Stacks/JOBS/OUT/populationsNEW_p11.out

PROCDIR="/home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS5"
RUNDIR="/share/thunderstorm/users/mmbrand/Karina/Stacks/RESULTS6_T90"
OUTDIR="/share/thunderstorm/users/mmbrand/Karina/Stacks/RESULTS6_T90"
MPARAM="/share/thunderstorm/users/mmbrand/Karina/Stacks/Barcodes_files/popmap_T90.txt"
tPARAM=$PBS_NP
rPARAM="0.4"
pPARAM="4" 
mPARAM="4" #removi nesta corrida -m $mPARAM
min_mafPARAM="0.05"
bPARAM="5" # tem que ser igual ao C,S,USTAKS

# create the OUTDIR Directory
if [ ! -d "$OUTDIR" ]; then
    mkdir $OUTDIR
fi

# Need to export due to GCC 6.1.0
export PATH LD_LIBRARY_PATH
PATH=/share/programs/gcc/6.1.0/bin/:$PATH
echo $LD_LIBRARY_PATH
LD_LIBRARY_PATH=/share/programs/gcc/6.1.0/lib/:/share/programs/gcc/6.1.0/lib64/:$LD_LIBRARY_PATH 

/home/mmbrand/programs/stacks/stacks-1.40/populations --verbose --write_random_snp -p $pPARAM -b $bPARAM -P $RUNDIR -s -t $tPARAM -M $MPARAM --min_maf $min_mafPARAM -r $rPARAM -f p_value -k --fasta --fasta_strict --vcf --vcf_haplotypes --genepop --structure --plink  --phylip --phylip_var --phylip_var_all --log_fst_comp --fstats 2>&1
