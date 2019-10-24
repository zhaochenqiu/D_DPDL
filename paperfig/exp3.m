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

pos = [     50 50
            165 200
            50 240
            65 190
            100 240
            200 100
            150 300
            80 60];

pos = [     50 50
            165 200
            50 240
            65 190
            200 100
            80 60];


[row_t column_t] = size(pos);

figure
for i = 1:row_t
    vec = squeeze(data(pos(i, 1), pos(i, 2), :));
    vec = vec - vec(end);
    
    showhist = hist(vec, -200:200);
    
    p = bar(-200:200, showhist, 'histc');
    set(p, 'EdgeColor', rand(1, 3), 'LineWidth', 2)
    hold on
    ylim([1 500])
end






% 
% 
% imgs = data(:, :, end);
% 
% % data = data - imgs;
% 
% 
% 
% 
% vec1 = squeeze(data(50,50,:));
% vec2 = squeeze(data(165,200,:));
% 
% vec1 = vec1 - vec1(end);
% vec2 = vec2 - vec2(end);
% 
% 
% hist1 = hist(vec1, -300:300);
% hist2 = hist(vec2, -300:300);
% 
% figure
% p1 = bar(-300:300 , hist1, 'histc', 'r')
% set(p1, 'EdgeColor', [0 1 0], 'LineWidth', 2)
% 
% hold on
% p2 = bar(-300:300, hist2, 'histc', 'b')
% set(p2, 'EdgeColor', [0 0 1], 'LineWidth', 2)
% 
% 
% 
% 
% 
% 
% 
% % num = 1660;
% 
% 
% % vector = double(data(100, 100, 1, :));
% % vector = squeeze(vector);
% % showhist = hist(vector, -200:200);
% % 
% % figure
% % bar(showhist,'histc',  'r')
% % ylim([0 255])
% % 
% 
% 
% 
% 
