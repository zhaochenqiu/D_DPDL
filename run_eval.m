clear all
close all
clc


addpath('~/projects/matrix/common/')
addpath('./function/')

addpath('./old/');


gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';


re_pa = '../result_old/';
re_ft = 'png';


[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);
[files_re fullfiles_re] = loadFiles_plus(re_pa, re_ft);


frames = max(size(fullfiles_gt));
store = [];

for i = 500:frames
    fgim = double(imread(fullfiles_re{i}));
    gtim = double(imread(fullfiles_gt{i}));

    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    store = [store; Re Pr Fm];
end

mean(store)

store1 = store;



gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';


re_pa = '../result/';
re_ft = 'png';


[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);
[files_re fullfiles_re] = loadFiles_plus(re_pa, re_ft);


frames = max(size(fullfiles_gt));
store = [];

for i = 500:frames
    fgim = double(imread(fullfiles_re{i}));
    gtim = double(imread(fullfiles_gt{i}));

    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    store = [store; Re Pr Fm];
end

mean(store)

store2 = store;


x = 1:1201;

figure
plot(x,store1(:,3))
hold on
plot(x,store2(:,3))
