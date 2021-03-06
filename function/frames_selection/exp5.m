clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');


% fg_pa = 'D:\dataset\dataset2014\dataset\baseline\pedestrians\groundtruth';
% fg_pa = 'D:\dataset\dataset2014\dataset\baseline\PETS2006\groundtruth';
% fg_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\fall\groundtruth';



fg_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';

fg_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
fg_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';

fg_ft = 'png';

[fs_im fullfs_im] = loadFiles_plus(fg_pa, fg_ft);

frames = max(size(fullfs_im));

mat = zeros(frames, 2);

for i = 1:frames
    fgim = double(imread(fullfs_im{i}));
    
    idx_fg = fgim == 255;
    idx_bk = fgim == 0;

    fgval = sum(sum(idx_fg));
    bkval = sum(sum(idx_bk));

    mat(i, 1) = fgval;
    mat(i, 2) = bkval;
end

list = mat(:, 1);


pos_record = [];

for i = 2:size(list)
    if xor(list(i - 1) == 0, list(i) == 0)
        pos_record = [pos_record; i];
    end
end

len = numel(pos_record);

if mod(len, 2) ~= 0
    pos_record = [pos_record; frames];
end

vallist = abs(list - list) + 1;

for i = 1:2:numel(pos_record)
    left = pos_record(i);
    right = pos_record(i +  1);

    data = list(left:right);
    val = mean(data);

    vallist(left:right) = val;
end

x = 1:frames;
y = list;
for i = 1:frames
    if y(i) > vallist(i)
        plot(x(i), y(i), '.:', 'Color', [0 0 1])
    else
        plot(x(i), y(i), '.:', 'Color', [1 0 0])
    end
    hold on
    drawnow
end

