#!/bin/bash

#SBATCH --time=72:00:00
#SBATCH --output=slurm_%j.out
#SBATCH --gres=gpu:1

matlab -nodesktop < run_all_detect.m

