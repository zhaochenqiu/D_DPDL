clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('./function/');

addpath('./old/');


fg_pa = '../detection/random_epoch_highway/';
fg_ft = 'png';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';


[files_fg fullfiles_fg] = loadFiles_plus(fg_pa, fg_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);


frames = max(size(fullfiles_gt));

store_entry = [];
store_fm = [];

for i = 1:frames
    fgim = double(imread(fullfiles_fg{i}));
    gtim = double(imread(fullfiles_gt{i}));

    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    store_entry = [store_entry; TP FP FN TN];
    store_fm = [store_fm; Re Pr Fm];
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

[Re Pr Fm]
