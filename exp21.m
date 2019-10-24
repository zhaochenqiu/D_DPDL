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
y1 = store1;
y2 = store2;

%y1 = y1 - 0.01;

figure
h1 = plot(x(1:20:700),store1(1:20:700,3),'.:','LineWidth',4);
hold on
h2 = plot(x(1:20:700),store2(1:20:700,3),'.:','LineWidth',4);
ylim([0.7,1])
xlim([0 700])
legend([h1 h2], 'Previous Method','Current Method','Location', 'southeast')
set (gcf,'Position',[10 180 800 500], 'Color',[1 1 1])
    
set(gca, 'FontSize', 18)
F = getframe(gcf);
imwrite(F.cdata, 'result.png')
