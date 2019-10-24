clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('./function/imdb_difference/');
addpath('./function/bayesian/');
addpath('../common/');
addpath('../common_c/');



run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

% abandonedBox  parking  sofa  streetLight  tramstop  winterDriveway


im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/abandonedBox_re/';
net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/abandonedBox_re/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);

