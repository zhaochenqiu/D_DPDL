clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('./function/');

addpath('./old/');



fg_pa = '../detection/random_epoch_highway/';
fg_pa = '../detection/random_epoch/highway_200/';
fg_pa = '../detection/random_epoch/pedestrains_60/';
fg_pa = '../detection/random_epoch/office_60/';
fg_pa = '../detection/random_epoch/PETS2006_60/';

fg_ft = 'png';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';


gt_ft = 'png';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';


im_ft = 'jpg';


[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_fg fullfiles_fg] = loadFiles_plus(fg_pa, fg_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);


frames = max(size(fullfiles_gt));

store_entry = [];
store_fm = [];

global g_displayMatrixImage
g_displayMatrixImage = 1;


figure
for i = 1:frames
    im   = double(imread(fullfiles_im{i}));
    fgim = double(imread(fullfiles_fg{i}));
    gtim = double(imread(fullfiles_gt{i}));

    oldfg = fgim;
    fgim = bayesRefine(im, fgim, 8, 1);

    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    store_entry = [store_entry; TP FP FN TN];
    store_fm = [store_fm; Re Pr Fm];

    displayMatrixImage(i, 2, 2, im, gtim, oldfg, fgim);
    i
end


% [TP FP FN TN] = sum(store_entry, 1);
list = sum(store_entry, 1);
TP = list(1);
FP = list(2);
FN = list(3);
TN = list(4);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

value = [Re Pr Fm]

txtWrite(value, 'temp.txt');


