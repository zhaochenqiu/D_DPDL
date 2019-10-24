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


% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/input/';
im_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/input/';
im_ft = 'jpg';

% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/groundtruth/';
gt_ft = 'png';

% fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/fountain01/';
% net_pa = '~/projects/matrix/network/iterative/dynamicBackground/fountain01/';

% fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/parking/';
% net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/parking/';

fg_pa = '~/projects/matrix/detection/iterative/lowFramerate/port_0_17fps/';
net_pa = '~/projects/matrix/network/iterative/lowFramerate/port_0_17fps/';




iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 10);

