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


% clear all
% close all
% clc
% 
% 
% 
% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/baseline/highway/';
% net_pa = '~/projects/matrix/network/iterative/baseline/highway/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);
% 
% 
% 
% clear all
% close all
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/baseline/office/';
% net_pa = '~/projects/matrix/network/iterative/baseline/office/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);
% 
% 
% 
% 
% clear all
% close all
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/baseline/pedestrians/';
% net_pa = '~/projects/matrix/network/iterative/baseline/pedestrians/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);
% 


clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/baseline/PETS2006/';
net_pa = '~/projects/matrix/network/iterative/baseline/PETS2006/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);


