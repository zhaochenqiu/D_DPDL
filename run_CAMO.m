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


% global g_gpuId
% g_gpuId = 2


im_pa = '~/dataset/CAMO-UOW/Videos/video1/';
%im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/input/';
im_ft = 'png';

% gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/groundtruth/';
gt_pa = '~/dataset/CAMO-UOW/Groundtruth/Tvideo1/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/CAMO/video1/';
%fg_pa = '~/projects/matrix/detection/iterative/turbulence/turbulence0/';
net_pa = '~/projects/matrix/network/CAMO/video1/'
% net_pa = '~/projects/matrix/network/iterative/turbulence/turbulence0/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



clear all
close all
clc


im_pa = '~/dataset/CAMO-UOW/Videos/video2/';
%im_pa = '~/dataset/dataset2024/dataset/turbulence/turbulence0/input/';
im_ft = 'png';

% gt_pa = '~/dataset/dataset2024/dataset/turbulence/turbulence0/groundtruth/';
gt_pa = '~/dataset/CAMO-UOW/Groundtruth/Tvideo2/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/CAMO/video2/';
%fg_pa = '~/projects/matrix/detection/iterative/turbulence/turbulence0/';
net_pa = '~/projects/matrix/network/CAMO/video2/'
% net_pa = '~/projects/matrix/network/iterative/turbulence/turbulence0/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



