clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');


% fg_pa = 'D:\dataset\dataset2014\dataset\baseline\pedestrians\groundtruth';
% fg_pa = 'D:\dataset\dataset2014\dataset\baseline\PETS2006\groundtruth';
% fg_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\fall\groundtruth';


fg_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';

fg_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';

% fg_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';

fg_ft = 'png';

[fs_im fullfs_im] = loadFiles_plus(fg_pa, fg_ft);

frames = max(size(fullfs_im));

mat = zeros(frames, 2);

for i = 1:frames
    fgim = double(imread(fullfs_im{i}));
    
    idx_fg = fgim == 255;
    idx_bk = fgim == 0;

    mat(i, 1) = sum(sum(idx_fg));
    mat(i, 2) = sum(sum(idx_bk));
end


x = 1:frames;
y = mat(:, 1)'


figure

plot(x,y,'.:');

y = mat(:, 2);
figure
plot(x,y,'.:');


list = mat(:, 1);
val = mean(list(list ~= 0));
val = max(list(list ~=0 ));

val

y = list;
x = 1:frames;
figure
for i = 1:frames
    if y(i) > val*1.1
        plot(x(i), y(i), 'o', 'Color', [0 0 1])
    else
        plot(x(i), y(i), 'o', 'Color', [1 0 0])
    end
    hold on
    drawnow
end


