#!/bin/bash
#PBS -m abe
#PBS -l nodes=1:ppn=4
#PBS -l walltime=350:00:00
#PBS -N USTACKS
#PBS -q default
#PBS -j oe
#PBS -o /PATH/TO/Stacks/JOBS/OUT/ustacks_T90.out

PROCDIR="/PATH/TO/PROC_READS6"
OUTDIR="/PATH/TO/Stacks/RESULTS6_T90"
mPARAM=5
pPARAM=$PBS_NP
MPARAM=2
NPARAM=2
max_locus_stacksPARAM=4
k_lenPARAM=10 # vou remover

USTACKS_CMMD=(/KBPlate2/GO30_13.fq.gz
/KBPlate2/BA34_15.fq.gz
/KBPlate2/PR51_14.fq.gz
/KBPlate2/A_RS9.fq.gz
/KBPlate2/SP17_6.fq.gz
/KBPlate2/SC3_18.fq.gz
/KBPlate2/GO30_16.fq.gz
/KBPlate2/SP17_14.fq.gz
/KBPlate2/RS17_16.fq.gz
/KBPlate2/SP17_11.fq.gz
/KBPlate2/BA34_17.fq.gz
/KBPlate2/BA34_18.fq.gz
/KBPlate2/RS17_13.fq.gz
/KBPlate2/GO30_15.fq.gz
/KBPlate2/SC3_13.fq.gz
/KBPlate2/PR52_18.fq.gz
/KBPlate2/PR52_15.fq.gz
/KBPlate2/SP17_16.fq.gz
/KBPlate2/RS16_11.fq.gz
/KBPlate2/PR51_16.fq.gz
/KBPlate2/RS17_11.fq.gz
/KBPlate2/RS16_17.fq.gz
/KBPlate2/MG20_13.fq.gz
/KBPlate2/BA34_10.fq.gz
/KBPlate2/MG20_14.fq.gz
/KBPlate2/SC3_17.fq.gz
/KBPlate2/RS16_15.fq.gz
/KBPlate2/RS17_18.fq.gz
/KBPlate2/MG20_12.fq.gz
/KBPlate2/A_RS17.fq.gz
/KBPlate2/SP17_10.fq.gz
/KBPlate2/GO30_17.fq.gz
/KBPlate2/GO30_12.fq.gz
/KBPlate2/PR51_11.fq.gz
/KBPlate2/SC3_14.fq.gz
/KBPlate2/PR52_16.fq.gz
/KBPlate2/A_RS12.fq.gz
/KBPlate2/PR51_10.fq.gz
/KBPlate2/A_RS14.fq.gz
/KBPlate2/GO30_11.fq.gz
/KBPlate2/SP17_9.fq.gz
/KBPlate2/BA34_16.fq.gz
/KBPlate2/RS16_16.fq.gz
/KBPlate2/MG20_15.fq.gz
/KBPlate2/PR52_14.fq.gz
/KBPlate2/BA34_12.fq.gz
/KBPlate2/A_RS13.fq.gz
/KBPlate2/GO31_14.fq.gz
/KBPlate2/RS16_10.fq.gz
/KBPlate2/BA34_11.fq.gz
/KBPlate2/A_RS15.fq.gz
/KBPlate2/MG20_17.fq.gz
/KBPlate2/SC3_11.fq.gz
/KBPlate2/PR52_12.fq.gz
/KBPlate2/SC3_16.fq.gz
/KBPlate2/PR52_11.fq.gz
/KBPlate2/PR51_13.fq.gz
/KBPlate2/A_RS10.fq.gz
/KBPlate2/RS17_12.fq.gz
/KBPlate2/RS17_15.fq.gz
/KBPlate2/MG20_11.fq.gz
/KBPlate2/PR52_13.fq.gz
/KBPlate2/SC3_15.fq.gz
/KBPlate2/SP17_17.fq.gz
/KBPlate2/A_RS11.fq.gz
/KBPlate2/BA34_14.fq.gz
/KBPlate2/GO31_15.fq.gz
/KBPlate2/MG20_10.fq.gz
/KBPlate2/RS16_14.fq.gz
/KBPlate2/BA34_13.fq.gz
/KBPlate2/MG20_16.fq.gz
/KBPlate2/GO31_12.fq.gz
/KBPlate2/SC3_12.fq.gz
/KBPlate2/PR51_12.fq.gz
/KBPlate2/PR52_10.fq.gz
/KBPlate2/RS17_17.fq.gz
/KBPlate2/SP17_12.fq.gz
/KBPlate2/GO30_14.fq.gz
/KBPlate2/RS17_14.fq.gz
/KBPlate2/PR51_17.fq.gz
/KBPlate2/RS17_10.fq.gz
/KBPlate2/A_RS16.fq.gz
/KBPlate2/SC3_10.fq.gz
/KBPlate2/SP17_15.fq.gz
/KBPlate2/RS16_12.fq.gz
/KBPlate2/GO30_10.fq.gz
/KBPlate2/MG20_18.fq.gz
/KBPlate2/SP17_13.fq.gz
/KBPlate2/PR51_15.fq.gz
/KBPlate2/GO31_13.fq.gz
/KBPlate2/RS16_13.fq.gz
/KBPlate2/PR52_17.fq.gz
/KBPlate2/GO31_11.fq.gz
/KBPlate2/PR51_9.fq.gz
/KBPlate2/GO31_10.fq.gz
/KBPlate2/GO30_7.fq.gz
/KBPlate4/MG20_30.fq.gz
/KBPlate4/BA34_29.fq.gz
/KBPlate4/PR51_30.fq.gz
/KBPlate4/GO30_30.fq.gz
/KBPlate4/A_RS29.fq.gz
/KBPlate4/SP17_28.fq.gz
/KBPlate4/GO31_28.fq.gz
/KBPlate4/PR52_28.fq.gz
/KBPlate4/MG20_25.fq.gz
/KBPlate4/RS16_30.fq.gz
/KBPlate4/GO31_29.fq.gz
/KBPlate4/RS17_30.fq.gz
/KBPlate4/MG20_28.fq.gz
/KBPlate4/RS17_29.fq.gz
/KBPlate4/BA34_30.fq.gz
/KBPlate4/RS16_28.fq.gz
/KBPlate4/A_RS32.fq.gz
/KBPlate4/MG20_29.fq.gz
/KBPlate4/PR51_27.fq.gz
/KBPlate4/GO31_30.fq.gz
/KBPlate4/BA34_28.fq.gz
/KBPlate4/SC3_29.fq.gz
/KBPlate4/MG20_23.fq.gz
/KBPlate4/GO30_28.fq.gz
/KBPlate4/RS16_29.fq.gz
/KBPlate4/A_RS31.fq.gz
/KBPlate4/SC3_28.fq.gz
/KBPlate4/SC3_30.fq.gz
/KBPlate4/MG20_26.fq.gz
/KBPlate4/SP17_27.fq.gz
/KBPlate4/RS16_27.fq.gz
/KBPlate4/GO30_26.fq.gz
/KBPlate4/A_RS33.fq.gz
/KBPlate4/MG20_27.fq.gz
/KBPlate4/MG20_24.fq.gz
/KBPlate4/RS16_26.fq.gz
/KBPlate4/PR51_29.fq.gz
/KBPlate4/GO30_29.fq.gz
/KBPlate4/RS17_28.fq.gz
/KBPlate4/GO30_27.fq.gz
/KBPlate4/SP17_29.fq.gz
/KBPlate4/PR51_28.fq.gz
/KBPlate4/SP17_30.fq.gz
/KBPlate4/GO31_27.fq.gz
/KBPlate4/PR52_29.fq.gz
/KBPlate4/GO30_7.fq.gz
/KBPlate1/GO31_1.fq.gz
/KBPlate1/RS17_5.fq.gz
/KBPlate1/RS16_2.fq.gz
/KBPlate1/SP17_6.fq.gz
/KBPlate1/SC3_7.fq.gz
/KBPlate1/PR52_9.fq.gz
/KBPlate1/A_RS4.fq.gz
/KBPlate1/RS17_4.fq.gz
/KBPlate1/SP17_1.fq.gz
/KBPlate1/MG20_7.fq.gz
/KBPlate1/PR51_8.fq.gz
/KBPlate1/MG20_3.fq.gz
/KBPlate1/RS16_6.fq.gz
/KBPlate1/RS16_8.fq.gz
/KBPlate1/BA34_6.fq.gz
/KBPlate1/RS17_6.fq.gz
/KBPlate1/SP17_7.fq.gz
/KBPlate1/SC3_3.fq.gz
/KBPlate1/SP17_5.fq.gz
/KBPlate1/PR52_5.fq.gz
/KBPlate1/BA34_2.fq.gz
/KBPlate1/GO30_2.fq.gz
/KBPlate1/PR52_8.fq.gz
/KBPlate1/A_RS6.fq.gz
/KBPlate1/GO30_4.fq.gz
/KBPlate1/GO30_8.fq.gz
/KBPlate1/SP17_2.fq.gz
/KBPlate1/SC3_4.fq.gz
/KBPlate1/GO30_5.fq.gz
/KBPlate1/PR52_2.fq.gz
/KBPlate1/A_RS2.fq.gz
/KBPlate1/PR52_4.fq.gz
/KBPlate1/PR51_1.fq.gz
/KBPlate1/RS16_4.fq.gz
/KBPlate1/BA34_4.fq.gz
/KBPlate1/GO30_6.fq.gz
/KBPlate1/GO31_2.fq.gz
/KBPlate1/GO31_4.fq.gz
/KBPlate1/PR51_3.fq.gz
/KBPlate1/RS16_7.fq.gz
/KBPlate1/GO31_6.fq.gz
/KBPlate1/RS17_3.fq.gz
/KBPlate1/GO31_9.fq.gz
/KBPlate1/SC3_8.fq.gz
/KBPlate1/MG20_5.fq.gz
/KBPlate1/SC3_1.fq.gz
/KBPlate1/RS16_5.fq.gz
/KBPlate1/GO30_1.fq.gz
/KBPlate1/PR51_2.fq.gz
/KBPlate1/BA34_9.fq.gz
/KBPlate1/GO31_3.fq.gz
/KBPlate1/PR52_3.fq.gz
/KBPlate1/MG20_4.fq.gz
/KBPlate1/A_RS5.fq.gz
/KBPlate1/A_RS7.fq.gz
/KBPlate1/MG20_6.fq.gz
/KBPlate1/GO31_8.fq.gz
/KBPlate1/PR51_6.fq.gz
/KBPlate1/RS16_1.fq.gz
/KBPlate1/PR51_5.fq.gz
/KBPlate1/A_RS1.fq.gz
/KBPlate1/GO30_9.fq.gz
/KBPlate1/RS16_9.fq.gz
/KBPlate1/A_RS3.fq.gz
/KBPlate1/GO31_7.fq.gz
/KBPlate1/SP17_8.fq.gz
/KBPlate1/RS16_3.fq.gz
/KBPlate1/MG20_2.fq.gz
/KBPlate1/RS17_1.fq.gz
/KBPlate1/PR52_7.fq.gz
/KBPlate1/GO31_5.fq.gz
/KBPlate1/RS17_2.fq.gz
/KBPlate1/MG20_1.fq.gz
/KBPlate1/BA34_8.fq.gz
/KBPlate1/RS17_7.fq.gz
/KBPlate1/SC3_2.fq.gz
/KBPlate1/SP17_3.fq.gz
/KBPlate1/A_RS8.fq.gz
/KBPlate1/RS17_9.fq.gz
/KBPlate1/SC3_6.fq.gz
/KBPlate1/PR51_4.fq.gz
/KBPlate1/BA34_5.fq.gz
/KBPlate1/SC3_5.fq.gz
/KBPlate1/PR52_1.fq.gz
/KBPlate1/BA34_1.fq.gz
/KBPlate1/PR51_7.fq.gz
/KBPlate1/SP17_4.fq.gz
/KBPlate1/GO30_3.fq.gz
/KBPlate1/PR52_6.fq.gz
/KBPlate1/BA34_3.fq.gz
/KBPlate1/RS17_8.fq.gz
/KBPlate1/MG20_8.fq.gz
/KBPlate1/SC3_9.fq.gz
/KBPlate1/BA34_7.fq.gz
/KBPlate1/MG20_9.fq.gz
/KBPlate1/GO30_7.fq.gz
/KBPlate3/PR52_26.fq.gz
/KBPlate3/MG20_22.fq.gz
/KBPlate3/GO30_19.fq.gz
/KBPlate3/GO31_24.fq.gz
/KBPlate3/SP17_6.fq.gz
/KBPlate3/SP17_19.fq.gz
/KBPlate3/GO30_18.fq.gz
/KBPlate3/MG20_20.fq.gz
/KBPlate3/BA34_23.fq.gz
/KBPlate3/PR51_25.fq.gz
/KBPlate3/PR52_23.fq.gz
/KBPlate3/A_RS19.fq.gz
/KBPlate3/PR51_18.fq.gz
/KBPlate3/PR52_25.fq.gz
/KBPlate3/SC3_19.fq.gz
/KBPlate3/PR52_22.fq.gz
/KBPlate3/PR52_19.fq.gz
/KBPlate3/PR52_24.fq.gz
/KBPlate3/MG20_21.fq.gz
/KBPlate3/RS17_20.fq.gz
/KBPlate3/GO30_24.fq.gz
/KBPlate3/A_RS18.fq.gz
/KBPlate3/BA34_27.fq.gz
/KBPlate3/PR51_26.fq.gz
/KBPlate3/SP17_18.fq.gz
/KBPlate3/GO30_20.fq.gz
/KBPlate3/SP17_26.fq.gz
/KBPlate3/PR51_19.fq.gz
/KBPlate3/RS16_25.fq.gz
/KBPlate3/BA34_22.fq.gz
/KBPlate3/BA34_19.fq.gz
/KBPlate3/RS17_23.fq.gz
/KBPlate3/PR51_21.fq.gz
/KBPlate3/BA34_25.fq.gz
/KBPlate3/RS17_21.fq.gz
/KBPlate3/RS17_25.fq.gz
/KBPlate3/BA34_24.fq.gz
/KBPlate3/A_RS25.fq.gz
/KBPlate3/GO30_23.fq.gz
/KBPlate3/PR51_22.fq.gz
/KBPlate3/RS16_24.fq.gz
/KBPlate3/SP17_23.fq.gz
/KBPlate3/GO31_16.fq.gz
/KBPlate3/SC3_20.fq.gz
/KBPlate3/GO31_19.fq.gz
/KBPlate3/GO30_21.fq.gz
/KBPlate3/RS17_24.fq.gz
/KBPlate3/GO31_21.fq.gz
/KBPlate3/RS17_26.fq.gz
/KBPlate3/RS17_22.fq.gz
/KBPlate3/MG20_19.fq.gz
/KBPlate3/SP17_20.fq.gz
/KBPlate3/PR52_20.fq.gz
/KBPlate3/RS16_20.fq.gz
/KBPlate3/PR52_27.fq.gz
/KBPlate3/GO31_20.fq.gz
/KBPlate3/SC3_25.fq.gz
/KBPlate3/SC3_23.fq.gz
/KBPlate3/GO31_18.fq.gz
/KBPlate3/RS16_19.fq.gz
/KBPlate3/GO31_22.fq.gz
/KBPlate3/A_RS20.fq.gz
/KBPlate3/SP17_24.fq.gz
/KBPlate3/RS16_21.fq.gz
/KBPlate3/SC3_21.fq.gz
/KBPlate3/PR51_20.fq.gz
/KBPlate3/BA34_26.fq.gz
/KBPlate3/RS16_23.fq.gz
/KBPlate3/GO30_25.fq.gz
/KBPlate3/GO30_22.fq.gz
/KBPlate3/A_RS24.fq.gz
/KBPlate3/GO31_17.fq.gz
/KBPlate3/GO31_26.fq.gz
/KBPlate3/GO31_25.fq.gz
/KBPlate3/SC3_26.fq.gz
/KBPlate3/BA34_20.fq.gz
/KBPlate3/PR51_23.fq.gz
/KBPlate3/PR52_21.fq.gz
/KBPlate3/SP17_25.fq.gz
/KBPlate3/BA34_21.fq.gz
/KBPlate3/A_RS27.fq.gz
/KBPlate3/A_RS21.fq.gz
/KBPlate3/RS16_18.fq.gz
/KBPlate3/SC3_24.fq.gz
/KBPlate3/A_RS28.fq.gz
/KBPlate3/GO31_23.fq.gz
/KBPlate3/SC3_27.fq.gz
/KBPlate3/PR51_24.fq.gz
/KBPlate3/RS17_27.fq.gz
/KBPlate3/RS17_19.fq.gz
/KBPlate3/SC3_22.fq.gz
/KBPlate3/SP17_21.fq.gz
/KBPlate3/A_RS26.fq.gz
/KBPlate3/RS16_22.fq.gz
/KBPlate3/SP17_22.fq.gz
/KBPlate3/GO30_7.fq.gz
);
COUNT=$PBS_ARRAYID
SHOW=$((COUNT - 1))
echo "running sequence $SHOW"

# Need to export due to GCC 6.1.0
export PATH LD_LIBRARY_PATH
PATH=/share/programs/gcc/6.1.0/bin/:$PATH
echo $LD_LIBRARY_PATH
LD_LIBRARY_PATH=/share/programs/gcc/6.1.0/lib/:/share/programs/gcc/6.1.0/lib64/:$LD_LIBRARY_PATH 

/home/mmbrand/programs/stacks/stacks-1.40/ustacks -t gzfastq -f $PROCDIR/${USTACKS_CMMD[$SHOW]} -o $OUTDIR -i $PBS_ARRAYID -m $mPARAM -p $pPARAM -M $MPARAM -N $NPARAM -r -d --max_locus_stacks $max_locus_stacksPARAM --k_len $k_lenPARAM 2>&1
echo ${#USTACKS_CMMD[@]}
