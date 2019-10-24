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

% 
% % global g_gpuId
% % g_gpuId = 2
% 
% im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/turbulence/turbulence0/';
% net_pa = '~/projects/matrix/network/iterative/turbulence/turbulence0/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);
% 



clear all
close all
clc


% global g_gpuId
% g_gpuId = 2


im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence1/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence1/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/turbulence/turbulence1/';
net_pa = '~/projects/matrix/network/iterative/turbulence/turbulence1/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


% 
% clear all
% close all
% clc
% 
% 
% % global g_gpuId
% % g_gpuId = 2
% 
% 
% im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence2/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence2/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/turbulence/turbulence2/';
% net_pa = '~/projects/matrix/network/iterative/turbulence/turbulence2/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);
% 
% 
% 
% clear all
% close all
% clc
% 
% 
% % global g_gpuId
% % g_gpuId = 2
% 
% 
% im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence3/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence3/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/turbulence/turbulence3/';
% net_pa = '~/projects/matrix/network/iterative/turbulence/turbulence3/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);
% 
