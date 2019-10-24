clear all
close all
clc

addpath('../../common');

im_pa = 'D:\dataset\dataset2014\dataset\baseline\highway\input';
im_ft = 'jpg';


[files data] = loadData_plus(im_pa, im_ft);





% num = 1660;


vector = double(data(100, 100, 1, :));
vector = squeeze(vector);
showhist = hist(vector, -200:200);

figure
bar(showhist,'histc',  'r')
ylim([0 255])





