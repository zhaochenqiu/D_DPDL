clear all
close all
clc


addpath('~/projects/matrix/common/')
addpath('~/projects/matrix/common_c/');


pa_im = '~/dataset/dataset2014/dataset/baseline/highway/input/';
ft_im = 'jpg';

pa_gt = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
ft_gt = 'png';

pa_sg = '~/projects/matrix/result/';
ft_sg = 'png';


[files_im fullpa_im] = loadFiles_plus(pa_im, ft_im);
[files_gt fullpa_gt] = loadFiles_plus(pa_gt, ft_gt);
[files_sg fullpa_sg] = loadFiles_plus(pa_sg, ft_sg);


index = 1481;

im = double(imread(fullpa_im{index}));
gt = double(imread(fullpa_gt{index}));
sg = double(imread(fullpa_sg{index}));


global g_displayMatrixImage

g_displayMatrixImage = 1;
figure
displayMatrixImage(1,1,3,im,gt,sg)


impos = img2pos(im);


[row column byte] = size(im);
features = zeros(row, column, 5);
features(:, :, 1:3) = im;
features(:, :, 4:5) = impos;

% matrix to vec
[row_f column_f byte_f] = size(features);
vec = reshape(features, row*column, byte_f);

for i = 1:byte_f
    vec(:, i) = vec(:, i)/max(vec(:, i));
end





