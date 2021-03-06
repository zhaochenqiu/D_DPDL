clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('./function/');


pa_im = '~/dataset/dataset2014/dataset/baseline/highway/input/';
pa_im = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
ft_im = 'jpg';

pa_gt = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
pa_gt = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
ft_gt = 'png';

pa_fg = '../detection/random_epoch/highway_40/';
pa_fg = '../pedestrians/iteration_01_net2fg/';
ft_fg = 'png';


[files_im fullfiles_im] = loadFiles_plus(pa_im, ft_im);
[files_gt fullfiles_gt] = loadFiles_plus(pa_gt, ft_gt);
[files_fg fullfiles_fg] = loadFiles_plus(pa_fg, ft_fg);


index = 933;


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


figure(1)
figure(2)
set(gcf, 'Color', [1 1 1])
for i = 1:1000
    fg = bayesRefine(im, fg, 3, 0.55);

    [TP FP FN TN] = evalution_entry(fg,gt);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    [Re Pr Fm]
    store_fm = [store_fm; Re Pr Fm];

    figure(1)
    displayMatrixImage(i, 1, 3, im, oldfg, fg)

    figure(2)
    plot(1:i + 1, store_fm(:, 3), '-o', 'Color', [0.5 0.5 1], 'LineWidth', 4)
    hold on
    plot(1:i + 1, store_fm(:, 2), '-o', 'Color', [0.5 1 0.5], 'LineWidth', 4)
    hold on
    plot(1:i + 1, store_fm(:, 1), '-o', 'Color', [1 0.5 0.5], 'LineWidth', 4)
    legend('Fm','Pr','Re', 'Location', 'southeast')
end
