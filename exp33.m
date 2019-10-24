clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('./function/');


pa_im = '~/dataset/dataset2014/dataset/baseline/highway/input/';
ft_im = 'jpg';

pa_gt = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
ft_gt = 'png';

pa_fg = '../detection/random_epoch/highway_40/';
ft_fg = 'png';


[files_im fullfiles_im] = loadFiles_plus(pa_im, ft_im);
[files_gt fullfiles_gt] = loadFiles_plus(pa_gt, ft_gt);
[files_fg fullfiles_fg] = loadFiles_plus(pa_fg, ft_fg);


index = 1680;


im = double(imread(fullfiles_im{index}));
gt = double(imread(fullfiles_gt{index}));
fg = double(imread(fullfiles_fg{index}));


[row_im column_im byte_im] = size(im);


impos = img2pos(im);
grayim = grayImage(im);
textim = siltpCodingC(grayim, 0.05);
clrim  = rgbNormal(im);







data = reshape(impos, row_im*column_im, 2);
labs = reshape(gt, row_im*column_im, 1);

idx0 = labs == 0;
idx1 = labs == 255;

data0 = data(idx0, :);
data1 = data(idx1, :);

figure
plot(data0(:, 1), data0(:, 2), 'r.', data1(:, 1), data1(:, 2), 'b.');


[row_data column_data] = size(data);


for i = 1:column_data
    temp = data(:, i);

    maxvalue = max(temp);
    temp = temp ./ maxvalue;

    data(:, i) = temp;
end

idx0 = labs == 0;
idx1 = labs == 255;

data0 = data(idx0, :);
data1 = data(idx1, :);

figure
plot(data0(:, 1), data0(:, 2), 'r.', data1(:, 1), data1(:, 2), 'b.');
