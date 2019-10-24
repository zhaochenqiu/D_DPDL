clear all
close all
clc

fg_pa = 'D:\dataset\dataset2014\dataset\baseline\pedestrians\groundtruth';
% fg_pa = 'D:\dataset\dataset2014\dataset\baseline\PETS2006\groundtruth';
fg_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\fall\groundtruth';
fg_ft = 'png';

[idx value] = selectBalFrame(fg_pa, fg_ft);

idx
value
