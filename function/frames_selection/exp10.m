clear all
close all
clc

% addpath('~/projects/matrix/common/');
% addpath('~/projects/matrix/common_c/');
% addpath('~/projects/matrix/bgs_cnn_plus/function/');

addpath('../../function/');
addpath('../../../common/');
addpath('../../../common_c/')


% fg_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
fg_pa = 'D:\dataset\dataset2014\dataset\baseline\ pedestrians\groundtruth';
fg_pa = 'D:\dataset\dataset2014\dataset\baseline\PETS2006\groundtruth';
fg_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
fg_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/groundtruth/';
fg_ft = 'png';


[fs_fg fullfs_fg] = loadFiles_plus(fg_pa, fg_ft);

frames = max(size(fullfs_fg));

nums = zeros(frames, 2);

for i = 1:frames
    fg = double(imread(fullfs_fg{i}));

    idx0 = fg == 0;
    idx1 = fg == 255;

    value0 = sum(sum(idx0));
    value1 = sum(sum(idx1));

    nums(i, 1) = value0;
    nums(i, 2) = value1;
end

x = 1:frames
idx = nums == 0;
nums(idx) = 1;

for j = 1:3
    peakpts = selectFg_hierarchy(fg_pa, fg_ft, 10)
end

ylist = nums(:, 2);


figure
plot(x, nums(:, 2), '-o', 'Color', rand(1, 3), 'LineWidth', 4)
hold on
plot(peakpts, ylist(peakpts), 'o', 'Color', [1 0 0]);
