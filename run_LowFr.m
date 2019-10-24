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


im_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/lowFramerate/port_0_17fps/';
net_pa = '~/projects/matrix/network/iterative/lowFramerate/port_0_17fps/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc



im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/lowFramerate/tramCrossroad_1fps/';
net_pa = '~/projects/matrix/network/iterative/lowFramerate/tramCrossroad_1fps/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



clear all
close all
clc



im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/lowFramerate/tunnelExit_0_35fps/';
net_pa = '~/projects/matrix/network/iterative/lowFramerate/tunnelExit_0_35fps/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


clear all
close all
clc



im_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/lowFramerate/turnpike_0_5fps/';
net_pa = '~/projects/matrix/network/iterative/lowFramerate/turnpike_0_5fps/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);

