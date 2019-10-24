clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('../common/');
addpath('../common_c/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/groundtruth/';
gt_ft = 'png';

fg_pa = '../detection/iterative/dynamicBackground/fall/';
net_pa = '../network/iterative/dynamicBackground/fall/';


im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/';
gt_ft = 'png';

fg_pa = '../detection/iterative/dynamicBackground/overpass/';
net_pa = '../network/iterative/dynamicBackground/overpass/';


im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';
gt_ft = 'png';

fg_pa = '../detection/iterative/baseline/PETS2006/';
net_pa = '../network/iterative/baseline/PETS2006/';




% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '../detection/iterative/baseline/highway/';
% net_pa = '../network/iterative/baseline/highway/';
% 

% im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '../detection/iterative/baseline/office/';
% net_pa = '../network/iterative/baseline/office/';
% 




% iterativelyTrain_test(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 20);

[idx1 rat1] = selectPeakBalFrame(gt_pa, gt_ft);

idx1
rat1

[idx2 rat2] = selectBalFrame(gt_pa, gt_ft);

idx2
rat2

