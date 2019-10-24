clear all
close all
clc

% addpath('~/projects/matrix/common/');
% addpath('~/projects/matrix/common_c/');


addpath('D:\projects\matrix\common');
addpath('D:\projects\matrix\common_c');



% iml_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
iml_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\overpass\input';
im_ft = 'jpg';


% imr_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
imr_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\canoe\input';
im_ft = 'jpg';



[fs fullfs] = loadFiles_plus(iml_pa, im_ft);

iml = double(imread(fullfs{1}));



[fs fullfs] = loadFiles_plus(imr_pa, im_ft);

imr = double(imread(fullfs{1}));



% figure
% displayMatrixImage(1,1,2, iml, imr)


[row_im column_im byte_im] = size(iml);
riml = iml(:, :, 1);
giml = iml(:, :, 2);
biml = iml(:, :, 3);


rhl = hist(reshape(riml, 1, row_im*column_im), 1:255);
ghl = hist(reshape(giml, 1, row_im*column_im), 1:255);
bhl = hist(reshape(biml, 1, row_im*column_im), 1:255);



[row_im column_im byte_im] = size(imr);
rimr = imr(:, :, 1);
gimr = imr(:, :, 2);
bimr = imr(:, :, 3);

rhr = hist(reshape(rimr,1, row_im*column_im), 1:255);
ghr = hist(reshape(gimr,1, row_im*column_im), 1:255);
bhr = hist(reshape(bimr,1, row_im*column_im), 1:255);


hl = [rhl ghl bhl];
hr = [rhr ghr bhr];

figure
bar(hl)


figure
bar(hr)
