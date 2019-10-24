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



clear all
close all
clc

im_ft = 'bmp';
gt_ft = 'png';



im_pa='~/dataset/LASIESTA/I_BS_01/I_BS_01/';
gt_pa='~/dataset/LASIESTA/I_BS_01/I_BS_01-GT/';
fg_pa = '~/projects/matrix/detection_test/iterative/LAS/I_BS_01/';
net_pa =  '~/projects/matrix/network_test/iterative/LAS/I_BS_01/';

iterativelyTrain_test1(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);





