clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('../common/');
addpath('../common_c/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')


im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/groundtruth/';
gt_ft = 'png';

fg_pa = '../detection/iterative/dynamicBackground/fountain02/';
net_pa = '../network/iterative/dynamicBackground/fountain02/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 10);

