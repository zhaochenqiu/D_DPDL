#!/bin/bash

#SBATCH --time=5:00:00
#SBATCH --output=slurm_%j.out
#SBATCH --gres=gpu:1

matlab -nodesktop < exp37_PickandTrain.m

