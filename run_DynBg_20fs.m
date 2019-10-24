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


clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/fountain01_20fs/';
net_pa = '~/projects/matrix/network/iterative/dynamicBackground/fountain01_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);

clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/overpass_20fs/';
net_pa = '~/projects/matrix/network/iterative/dynamicBackground/overpass_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/fountain02_20fs/';
net_pa = '~/projects/matrix/network/iterative/dynamicBackground/fountain02_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);





clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/fall_20fs/';
net_pa = '~/projects/matrix/network/iterative/dynamicBackground/fall_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);





clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/canoe_20fs/';
net_pa = '~/projects/matrix/network/iterative/dynamicBackground/canoe_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/input/'
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/dynamicBackground/boats_20fs/';
net_pa = '~/projects/matrix/network/iterative/dynamicBackground/boats_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



