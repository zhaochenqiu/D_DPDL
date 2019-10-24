clear all
close all
clc

% addpath('~/projects/matrix/common/');
% addpath('~/projects/matrix/common_c/');


addpath('D:\projects\matrix\common');
addpath('D:\projects\matrix\common_c');



% iml_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
iml_pa = 'D:\dataset\dataset2014\dataset\shadow\busStation\input';
im_ft = 'jpg';


% imr_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
imr_pa = 'D:\dataset\dataset2014\dataset\baseline\pedestrians\input';
im_ft = 'jpg';



[fs fullfs] = loadFiles_plus(iml_pa, im_ft);

iml = double(imread(fullfs{1}));
% iml = rgb2lab(iml);


hl = getRGBHist(iml);


[fs fullfs] = loadFiles_plus(imr_pa, im_ft);

imr = double(imread(fullfs{1}));
% imr = rgb2lab(imr);

hr = getRGBHist(imr);

figure
subplot(2,1,1)
bar(hl)

subplot(2,1,2)
bar(hr)


