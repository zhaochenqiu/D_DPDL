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
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/'
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/fountain01/';
% net_pa = '~/projects/matrix/network/iterative/dynamicBackground/fountain01/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);
% 
% clear all
% close eall
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/'
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/overpass/';
% net_pa = '~/projects/matrix/network/iterative/dynamicBackground/overpass/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);
% 
% 
% clear all
% close all
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/input/'
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/fountain02/';
% net_pa = '~/projects/matrix/network/iterative/dynamicBackground/fountain02/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);
% 
% 
% 
% 
% 
% 
% 
% 
% clear all
% close all
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/'
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/canoe/';
% net_pa = '~/projects/matrix/network/iterative/dynamicBackground/canoe/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);
% 


% clear all
% close all
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/input/'
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/boats/';
% net_pa = '~/projects/matrix/network/iterative/dynamicBackground/boats/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);
% 


clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/fall/';
net_pa = '~/projects/matrix/network/iterative/dynamicBackground/fall/';


iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);


