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


figure
plot(x, nums(:, 1), '-o', 'Color', rand(1, 3), 'LineWidth', 4)

figure
plot(x, nums(:, 2), '-o', 'Color', rand(1, 3), 'LineWidth', 4)

res1 = derivative1D(nums(:, 2), 4);

figure
plot(x, res1, '-o', 'Color', rand(1, 3), 'LineWidth', 4)




figure
plot(x, log(nums(:, 1)), '-o', 'Color', rand(1, 3), 'LineWidth', 4)

figure
plot(x, log(nums(:, 2)), '-o', 'Color', rand(1, 3), 'LineWidth', 4)

res1 = derivative1D(log(nums(:, 2)), 4);

figure
plot(x, res1, '-o', 'Color', rand(1, 3), 'LineWidth', 4)


% res1 = derivative1D(log(res1), 4);
res1 = abs(res1);

figure
plot(x, res1, '-o', 'Color', rand(1, 3), 'LineWidth', 4)

idx = res1 ~= 0;

figure
plot(x(idx), res1(idx), '-o', 'Color', rand(1, 3), 'LineWidth', 4)


