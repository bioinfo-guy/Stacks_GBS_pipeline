#!/bin/bash
#PBS -M brandao.marcelo@gmail.com
#PBS -m abe
#PBS -N STACKS_6
#PBS -l nodes=thunder-0-6:ppn=16
#PBS -q default
#PBS -j oe
#PBS -o /home/mmbrand/thunderstorm/Karina/Stacks/JOBS/Stacksnew.out

############
# Variables
############

NP=$((PBS_NP-1)) # Number of processors
RUNDIR="/share/thunderstorm/users/mmbrand/Karina/Stacks/"
READSDIR="/share/thunderstorm/users/mmbrand/Karina/Stacks/PROC_READS2/"
OUTDIR="/share/thunderstorm/users/mmbrand/Karina/Stacks/RESULTS_new"
POPFILE="/share/thunderstorm/users/mmbrand/Karina/Stacks/Barcodes_files/popmap3col.txt"
DATABASE="stacks_user"
LOCALDIR="/state/partition1/"
DESC="Populations GBS_2016"
OPT_m="6" # Minimum depth of coverage required to create a stack (default 2).
OPT_M="4" # Maximum distance (in nucleotides) allowed between stacks (default 2).
OPT_n="2" # specify the number of mismatches allowed between loci when building the catalog (default 0).
OPT_r="0.75" # minimum percentage of individuals in a population required to process a locus for that population.
OPT_MLS="4" # maximum number of stacks at a single de novo locus (default 3).
################
# Create OUTDIR
################

if [ ! -d "$OUTDIR" ]; then
    mkdir $OUTDIR
fi


#############################
# Copy fastq.gz to local dir
#############################

cd $RUNDIR

###################
# Run Stacks
###################

~/programs/stacks/bin/denovo_map.pl -T $NP \
-O $POPFILE \
-B $DATABASE \
-b 1 \
-D "$DESC" \
-o $OUTDIR \
-e /share/programs/stacks/bin/ \
-S \
-m $OPT_m \
-n 2 \
-X "ustacks: -p $NP -M $OPT_M -r -d --max_locus_stacks $OPT_MLS" \
-X "populations: -t $NP -r $OPT_r --fasta --fasta_strict --vcf --genepop --structure --plink  --phylip --phylip_var --phylip_var_all" \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/A_RS8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/BA34_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO30_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/GO31_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/MG20_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR51_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/PR52_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS16_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/RS17_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SC3_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_1.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_2.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_3.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_4.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_5.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate1/SP17_8.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/A_RS9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/BA34_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO30_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO31_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO31_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO31_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO31_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO31_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/GO31_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/MG20_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR51_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/PR52_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS16_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/RS17_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SC3_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_10.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_11.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_12.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_13.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_14.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_15.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate2/SP17_9.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/A_RS28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/BA34_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO30_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_16.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_17.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/GO31_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/MG20_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/MG20_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/MG20_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/MG20_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR51_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/PR52_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS16_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/RS17_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SC3_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_18.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_19.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_20.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_21.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_22.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate3/SP17_6.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/A_RS29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/A_RS31.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/A_RS32.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/A_RS33.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/BA34_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/BA34_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/BA34_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO30_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO30_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO30_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO30_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO30_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO30_7.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO31_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO31_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO31_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/GO31_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_23.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_24.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_25.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/MG20_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/PR51_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/PR51_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/PR51_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/PR51_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/PR52_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/PR52_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS16_26.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS16_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS16_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS16_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS16_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS17_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS17_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/RS17_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/SC3_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/SC3_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/SC3_30.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/SP17_27.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/SP17_28.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/SP17_29.fq.gz \
-s /home/mmbrand/thunderstorm/Karina/Stacks/PROC_READS2/KBPlate4/SP17_30.fq.gz
