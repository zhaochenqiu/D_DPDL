clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('./function/imdb_difference/');
addpath('../common/');
addpath('../common_c/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')


im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_ft = 'png';

fg_pa = '../detection_trans/iterative/baseline/pedestrians_trans/';
net_pa = '../network_trans/iterative/baseline/pedestrians_trans/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);

