#!/bin/bash

#SBATCH --time=1:00:00
#SBATCH --output=slurm_%j.out
#SBATCH --gres=gpu:1

matlab -nodesktop < exp1.m
