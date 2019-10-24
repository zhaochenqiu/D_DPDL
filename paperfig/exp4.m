clear all
close all
clc

addpath('../../common');

im_pa = 'D:\dataset\dataset2014\dataset\baseline\highway\input';
im_ft = 'jpg';


[files data] = loadData_plus(im_pa, im_ft);
data = double(data);

num = 1660;

data = data(:, :, 1, 1:num);

data = squeeze(data);


pos = [     165 200
            50 240
            200 100
            80 60];

clrs = [0.8 0.8 0.8
        0.81 0.81 0.81
        0.05 0.05 0.05
        0.35 0.35 0.35];

[row_t column_t] = size(pos);

figure
set(gcf, 'Position', [10 10 1800 400], 'Color', [1 1 1])
for i = 1:row_t
    vec = squeeze(data(pos(i, 1), pos(i, 2), :));
    vec = vec - vec(end);

    showhist = hist(vec, -400:400);
    showhist = showhist(201:end - 200);

    p = bar(-200:200, showhist, 'histc');
%    clr = rand(1, 3);
    clr = clrs(i, :);
    set(p, 'FaceColor', clr, 'EdgeColor', clr, 'LineWidth', 2)
    hold on
    ylim([10 300])
end
% axis off
% 
% F=getframe(gcf);
% imwrite(F.cdata,'distribution.png')
