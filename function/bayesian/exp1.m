clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');


im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
gt_ft = 'png';

fg_pa = '../../../fountain01/iteration_01_net2fg/';
fg_ft = 'png';


sv_pa_2D = '../../../bayesian_2D/';
sv_pa_3D = '../../../bayesian_3D/';


[fs_im fullfs_im] = loadFiles_plus(im_pa, im_ft);
[fs_fg fullfs_fg] = loadFiles_plus(fg_pa, fg_ft);
[fs_gt fullfs_gt] = loadFiles_plus(gt_pa, gt_ft);



radius = 4;
deep = 4;
rate = 0.2;


im = imread(fullfs_im{1});
[row_im column_im byte_im] = size(im);


frames = max(size(fullfs_im));

for i = 680:frames
    if i < 300
        fgim = double(imread(fullfs_gt{1}));
        saveImage(fgim, sv_pa_3D, fs_fg{i});
        saveImage(fgim, sv_pa_2D, fs_fg{i});
    else
        im_block = zeros(row_im, column_im, byte_im, deep);
        fg_block = zeros(row_im, column_im, 1      , deep);

        for d = 1:deep
            im = double(imread(fullfs_im{i - d + 1}));
            fg = double(imread(fullfs_fg{i - d + 1}));

            im_block(:, :, :, d) = im;
            fg_block(:, :, :, d) = fg;
        end

        % the groundtruth includes value of 85
        fg_block(fg_block ~= 255) = 0;
        oldfg = fg_block(:, :, :, 1);

        fgim = bayesRefine_3D(im_block, fg_block, radius, rate);
        fg_block(:, :, :, 1) = fgim;
        fgim = bayesRefine_3D(im_block, fg_block, radius, rate);
        fg_block(:, :, :, 1) = fgim;
        fgim = bayesRefine_3D(im_block, fg_block, radius, rate);

        disp('3d')

        fgim_2D = bayesRefine(im_block(:, :, :, 1), oldfg, 4, 0.6);
        fgim_2D = bayesRefine(im_block(:, :, :, 1), fgim_2D, 4, 0.6);
        fgim_2D = bayesRefine(im_block(:, :, :, 1), fgim_2D, 4, 0.6);

        disp('2d')

        displayMatrixImage(i, 2, 3,im_block(:, :, :, 1), oldfg, imread(fullfs_gt{i}), imread(fullfs_gt{i}), fgim_2D, fgim);

%        input('pause')

        saveImage(fgim, sv_pa_3D, fs_fg{i});
        saveImage(fgim_2D, sv_pa_2D, fs_fg{i});




    end
end
