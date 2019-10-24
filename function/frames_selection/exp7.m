clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');


% fg_pa = 'D:\dataset\dataset2014\dataset\baseline\pedestrians\groundtruth';
% fg_pa = 'D:\dataset\dataset2014\dataset\baseline\PETS2006\groundtruth';
% fg_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\fall\groundtruth';



fg_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';

fg_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';

fg_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
fg_ft = 'png';


[re_idxes re_rates] = selectPoFgRand(fg_pa, fg_ft, 2);

size(re_idxes)
re_idxes
re_rates


[re_idxes re_rates] = selectBkRand(fg_pa, fg_ft, 2);
size(re_idxes)

re_idxes
re_rates

