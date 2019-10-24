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

pa_fg = '../detection/random_epoch_highway/';
ft_fg = 'png';


[files_im fullfiles_im] = loadFiles_plus(pa_im, ft_im);
[files_gt fullfiles_gt] = loadFiles_plus(pa_gt, ft_gt);
[files_fg fullfiles_fg] = loadFiles_plus(pa_fg, ft_fg);


index = 1680;


im = double(imread(fullfiles_im{index}));
gt = double(imread(fullfiles_gt{index}));
fg = double(imread(fullfiles_fg{index}));


store_fm = [];

oldfg = fg;





[TP FP FN TN] = evalution_entry(fg,gt);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]
store_fm = [store_fm; Re Pr Fm];


global g_displayMatrixImage
g_displayMatrixImage = 1;


figure
for i = 1:1000
    fg = bayesRefine(im, fg, 4, 1);

    [TP FP FN TN] = evalution_entry(fg,gt);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    [Re Pr Fm]
    store_fm = [store_fm; Re Pr Fm];

    displayMatrixImage(i, 1, 3, im, oldfg, fg)
end
