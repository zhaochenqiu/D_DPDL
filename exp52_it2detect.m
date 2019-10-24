clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('./function/');

addpath('./old/');



% fg_pa = '../detection/random_epoch/highway_60/';
% fg_pa = '../detection/random_epoch/pedestrains_60/';
% fg_pa = '../detection/random_epoch/office_60/';
% fg_pa = '../detection/random_epoch/PETS2006_60/';
% fg_pa = '../detection/random_recur_10trains/';
fg_pa = '../detection/random_epoch/pedestrains_60/';

fg_ft = 'png';

% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';


gt_ft = 'png';

% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';


im_ft = 'jpg';



%path_save = '../detection/random_recur_10trains_bayes/';
path_save = '../detection/fg2bayes_it2/pedestrians/';








[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_fg fullfiles_fg] = loadFiles_plus(fg_pa, fg_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);


frames = max(size(fullfiles_gt));

store_entry = [];
store_fm = [];

store_all = [];



num_bay = 3;

figure

global g_displayMatrixImage
g_displayMatrixImage = 1;


for i = 1:frames
    if i < 300
        fgim = double(imread(fullfiles_gt{1}));
        saveImage(fgim, path_save, files_fg{i});
    else
        im   = double(imread(fullfiles_im{i}));
        fgim = double(imread(fullfiles_fg{i}));
        gtim = double(imread(fullfiles_gt{i}));

        oldfg = fgim;

        store_temp = [];

        [TP FP FN TN] = evalution_entry(fgim,gtim);

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        store_temp = [store_temp; Re Pr Fm]


        for j = 1:num_bay
            fgim = bayesRefine(im, fgim, 4, 0.9);

            [TP FP FN TN] = evalution_entry(fgim,gtim);

            Re = TP/(TP + FN);
            Pr = TP / (TP + FP);
            Fm = (2*Pr*Re)/(Pr + Re);

            store_temp = [store_temp; Re Pr Fm]

            plot(1:j + 1, store_temp(:, 3), '-o', 'Color', [0.5 0.5 1], 'LineWidth', 4)
            hold on
            plot(1:j + 1, store_temp(:, 2), '-o', 'Color', [0.5 1 0.5], 'LineWidth', 4)
            hold on
            plot(1:j + 1, store_temp(:, 1), '-o', 'Color', [1 0.5 0.5], 'LineWidth', 4)
            legend('Fm','Pr','Re', 'Location', 'southeast')
            drawnow
        end



        [TP FP FN TN] = evalution_entry(fgim,gtim);

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        store_entry = [store_entry; TP FP FN TN];
        store_fm = [store_fm; Re Pr Fm];

        showim = emphImage_byMask(im, fgim, [200 101 100], 0.7);

        saveImage(fgim, path_save, files_fg{i});


        displayMatrixImage(i, 2, 3, im, gtim, showim, oldfg, fgim, im);
        i
    end
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


