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



fg = gt;



[row column byte] = size(im);

impos = img2pos(im);

features = zeros(row, column, 5);

features(:, :, 1:3) = im;
features(:, :, 4:5) = impos;
features(:, :, 4:5) = im(:, :, 1:2);

[row_f column_f byte_f] = size(features);

ex_feats = features;
ex_label = fg;

% normalize each of dimension of features
for i = 1:byte_f
    temp = ex_feats(:, :, i);

    maxvalue = max(max(temp));
    temp = temp ./ maxvalue;

    ex_feats(:, :, i) = temp;
end

% normalize the magnitude of each feature vector
len_feats = ex_feats .* ex_feats;
len_feats = sum(len_feats, 3);
len_feats = len_feats .^ (0.5);

for i = 1:byte_f
    temp = ex_feats(:, :, i);

    temp = temp ./ len_feats;

    ex_feats(:, :, i) = temp;
end


data = reshape(ex_feats, row_f*column_f, byte_f);
labs = reshape(ex_label, row_f*column_f, 1);

idx = 1:10:row_f*column_f;

data = data(idx,:);
labs = labs(idx);

[U S V] = svd(data);
num = 2;
newdata = U*S(:, 1:num);


idx0 = labs == 0;
idx1 = labs == 255;

data0 = data(idx0, :);
data1 = data(idx1, :);

figure
plot(data0(:, 1), data0(:, 2), 'r.', data1(:, 1), data1(:, 2), 'b.');

