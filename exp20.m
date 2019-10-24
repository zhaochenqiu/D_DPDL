clear all
close all
clc


addpath('~/projects/matrix/common/')
addpath('~/projects/matrix/common_c/');
addpath('./function/');


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


resg = bayesRefine(im, sg, 4, 1);

store_fm = [];


global g_displayMatrixImage

g_displayMatrixImage = 1;
figure

for i = 1:100
    resg = bayesRefine(im, resg, 10, 1);


    [TP FP FN TN] = evalution_entry(resg,gt);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    value = [Re Pr Fm]
    store_fm = [store_fm ; value];

    displayMatrixImage(1,1,2, im, resg)
end







displayMatrixImage(1,2,2,im,gt,sg, resg)


[TP FP FN TN] = evalution_entry(resg,gt);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]




[TP FP FN TN] = evalution_entry(sg,gt);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]


