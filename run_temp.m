clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('../common/');
addpath('../common_c/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')


% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '../detection/iterative/dynamicBackground/fountain01/';
% net_pa = '../network/iterative/dynamicBackground/fountain01/';


% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '../detection/iterative/baseline/highway/';
% net_pa = '../network/iterative/baseline/highway/';

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
gt_ft = 'png';

fg_pa = '../detection/iterative/dynamicBackground/fountain01/';
net_pa = '../network/iterative/dynamicBackground/fountain01/';




iterativelyTrain_test(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 10);

% radius = 9;
% idx = 1149;
% 
% 
% 
% imdb = getMultiRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'train', 'set');
% imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'get');
% 
% balimdb = balanceImdb_plus(imdb);
