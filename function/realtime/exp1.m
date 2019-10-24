clear all
close all
clc

%addpath('./function/');
addpath('../../function/');
addpath('../../function/frames_selection/');
addpath('../../function/imdb_difference/');
addpath('../../function/bayesian/');
addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');



run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')


im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/highway/';

net_pa = '~/projects/lab/highway/iteration_01/net-epoch-40.mat';


net = load(net_pa);
net = net.net;


[files fullfiles] = loadFiles_plus(im_pa, im_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);

frames = max(size(files));

[row_im column_im byte_im] = size(double(imread(fullfiles{1})));

store_entry = [];

ROI_list = getTempROI(gt_pa, gt_ft);

radius = 25;


alltime1 = 0;
alltime2 = 0;

for j = 600:frames
    j
%            if j < 300
    if ROI_list(j) < 10
%         fgim = zeros(row_im, column_im) + 85;
%         displayMatrixImage(j,1,2,fgim,fgim)
% 
%         str = sprintf('re%06d',j);
%         str = [str '.png'];
%         saveImage(fgim, fg_pa, str);
    else

        im = double(imread(fullfiles{j}));
        gtim = double(imread(fullfiles_gt{j}));

        imdb = getRPoTP_scale(im_pa, im_ft, gt_pa, gt_ft, j, radius^2,'test', 0.5);

        tic
        [fgim temp] = getFgImg(net, imdb, 6000);
        fgim = scaleImage(fgim, 2);
        
        fgim = bayesRefine(im, fgim, 3, 0.6);
        fgim = bayesRefine(im, fgim, 3, 0.6);
        fgim = bayesRefine(im, fgim, 3, 0.6);




        time1 = toc;
        time1

        [TP FP FN TN] = evalution_entry(fgim,gtim);
        store_entry = [store_entry; TP FP FN TN];

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re)


        list = sum(store_entry, 1);
        TP = list(1);
        FP = list(2);
        FN = list(3);
        TN = list(4);


        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        value = [Re Pr Fm]


        showim = im;

        idx = fgim == 0;
        for b = 1:3
            tempim = showim(:, :, 1);
            tempim(idx) = 255;
            showim = tempim;
        end



        displayMatrixImage(j, 2, 2, im, fgim, showim, gtim);

        str = sprintf('re%06d',j);
        str = [str '.png'];
        saveImage(fgim, fg_pa, str);
    end
end

list = sum(store_entry, 1);
TP = list(1);
FP = list(2);
FN = list(3);
TN = list(4);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

value = [Re Pr Fm];

txtWrite(value, sprintf('%s_iteration_%02d_fg.txt', pa_name, i));


