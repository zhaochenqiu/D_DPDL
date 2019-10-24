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


% corridor  diningRoom  lakeSide  library  park


clear all
close all
clc

% global g_gpuId
% g_gpuId = 3


im_pa = '~/dataset/dataset2014/dataset/PTZ/continuousPan/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/PTZ/continuousPan/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/PTZ/continuousPan/';
net_pa = '~/projects/matrix/network/iterative/PTZ/continuousPan/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc

% global g_gpuId
% g_gpuId = 3


im_pa = '~/dataset/dataset2014/dataset/PTZ/intermittentPan/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/PTZ/intermittentPan/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/PTZ/intermittentPan/';
net_pa = '~/projects/matrix/network/iterative/PTZ/intermittentPan/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);

clear all
close all
clc

% global g_gpuId
% g_gpuId = 3


im_pa = '~/dataset/dataset2014/dataset/PTZ/twoPositionPTZCam/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/PTZ/twoPositionPTZCam/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/PTZ/twoPositionPTZCam/';
net_pa = '~/projects/matrix/network/iterative/PTZ/twoPositionPTZCam/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


clear all
close all
clc

% global g_gpuId
% g_gpuId = 3


im_pa = '~/dataset/dataset2014/dataset/PTZ/zoomInZoomOut/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/PTZ/zoomInZoomOut/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/PTZ/zoomInZoomOut/';
net_pa = '~/projects/matrix/network/iterative/PTZ/zoomInZoomOut/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);

