clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('./function/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')


idx = 2582;

% training the network
im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';
im_pa = '~/dataset/MRC/imagesp/';

im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';
gt_pa = '~/dataset/MRC/imagesp/groundtruth/';

gt_ft = 'png';


[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);



path_save_im = '~/dataset/MRC/imagesp_small/';
path_save_gt = '~/dataset/MRC/imagesp_small/groundtruth/';


frames = max(size(fullfiles_im));

for i = 1:frames
    im = double(imread(fullfiles_im{i}));
    gt = double(imread(fullfiles_gt{i}));

    im = scaleImage(im, 0.25);
    gt = scaleImage(gt, 0.25);

    saveImage(im, path_save_im, files_im{i});
    saveImage(gt, path_save_gt, files_gt{i});
    i
end

