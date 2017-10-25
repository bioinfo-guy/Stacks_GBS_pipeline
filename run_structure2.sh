#!/bin/bash
#PBS -m abe
#PBS -N Strucuture_2016
#PBS -l nodes=1:ppn=4
#PBS -q default
#PBS -j oe
#PBS -t 2-12
#PBS -o /PATH/TO/JOBS/OUT/Structure.out

cd /PATH/TO/Structure/

T=1  #do not change
R=1  #do not change
E=20 #number of replicates
NP=$(wc -l $PBS_NODEFILE | awk '{print $1}')
mainparams="mainparams"
extraparams="extraparams"
INFILE="Sfrugiperda_structure.txt"
#run the number of replicates $E
while [ $R -le $E ]
do
    #run the K using $PBS_ARRAYID
    if [ $T -le $NP ]; then
   echo "Running rep $R thread $T"
   ~/programs/structure/structure -m $mainparams -K $PBS_ARRAYID -e $extraparams -i $INFILE -o ${infile}_k$PBS_ARRAYID\_rep$R > output_k$PBS_ARRAYID\_rep$R.txt &
   T=$((T+1))
   R=$((R+1))
else
    wait
    T=1
fi
done
