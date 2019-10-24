#!/bin/bash

#SBATCH --time=100:00:00
#SBATCH --output=slurm_%j.out
#SBATCH --gres=gpu:1

matlab -nodesktop < run_Trans_highway.m
