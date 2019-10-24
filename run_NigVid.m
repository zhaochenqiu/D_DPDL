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


% corridor  diningRoom  lakeSide  library  park


clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/nightVideos/bridgeEntry/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/nightVideos/bridgeEntry/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/nightVideos/bridgeEntry/';
net_pa = '~/projects/matrix/network/iterative/nightVideos/bridgeEntry/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/nightVideos/busyBoulvard/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/nightVideos/busyBoulvard/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/nightVideos/busyBoulvard/';
net_pa = '~/projects/matrix/network/iterative/nightVideos/busyBoulvard/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/nightVideos/fluidHighway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/nightVideos/fluidHighway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/nightVideos/fluidHighway/';
net_pa = '~/projects/matrix/network/iterative/nightVideos/fluidHighway/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/nightVideos/streetCornerAtNight/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/nightVideos/streetCornerAtNight/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/nightVideos/streetCornerAtNight/';
net_pa = '~/projects/matrix/network/iterative/nightVideos/streetCornerAtNight/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/nightVideos/tramStation/';
net_pa = '~/projects/matrix/network/iterative/nightVideos/tramStation/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/nightVideos/winterStreet/';
net_pa = '~/projects/matrix/network/iterative/nightVideos/winterStreet/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


