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


% .  ..  blizzard  skating  snowFall  wetSnow

% global g_gpuId
% g_gpuId = 1



im_pa = '~/dataset/dataset2014/dataset/badWeather/blizzard/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/badWeather/blizzard/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/badWeather/blizzard/';
net_pa = '~/projects/matrix/network/iterative/badWeather/blizzard/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


clear all
close all
clc

% global g_gpuId
% g_gpuId = 1


im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/badWeather/skating/';
net_pa = '~/projects/matrix/network/iterative/badWeather/skating/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


clear all
close all
clc

% global g_gpuId
% g_gpuId = 1


im_pa = '~/dataset/dataset2014/dataset/badWeather/snowFall/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/badWeather/snowFall/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/badWeather/snowFall/';
net_pa = '~/projects/matrix/network/iterative/badWeather/snowFall/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


clear all
close all
clc

% global g_gpuId
% g_gpuId = 1


im_pa = '~/dataset/dataset2014/dataset/badWeather/wetSnow/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/badWeather/wetSnow/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/badWeather/wetSnow/';
net_pa = '~/projects/matrix/network/iterative/badWeather/wetSnow/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



