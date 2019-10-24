clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('./function/imdb_difference/');
addpath('./function/bayesian/');
addpath('../common/');
addpath('../common_c/');



run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

% abandonedBox  parking  sofa  streetLight  tramstop  winterDriveway
clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/winterDriveway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/winterDriveway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/winterDriveway/';
net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/winterDriveway/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);








clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/tramstop/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/tramstop/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/tramstop/';
net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/tramstop/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);






clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/abandonedBox/';
net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/abandonedBox/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);




clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/parking/';
net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/parking/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);




clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/sofa/';
net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/sofa/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);


clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/intermittentObjectMotion/streetLight/';
net_pa = '~/projects/matrix/network/iterative/intermittentObjectMotion/streetLight/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);





