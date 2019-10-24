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

% clear all
% close all
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/thermal/corridor/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/thermal/corridor/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/thermal/corridor/';
% net_pa = '~/projects/matrix/network/iterative/thermal/corridor/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);
% 
% 
% 
% clear all
% close all
% clc
% 
% im_pa = '~/dataset/dataset2014/dataset/thermal/library/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/thermal/library/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection/iterative/thermal/library/';
% net_pa = '~/projects/matrix/network/iterative/thermal/library/';
% 
% iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);
% 

clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/thermal/lakeSide/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/thermal/lakeSide/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/thermal/lakeSide/';
net_pa = '~/projects/matrix/network/iterative/thermal/lakeSide/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);




clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/thermal/diningRoom/';
net_pa = '~/projects/matrix/network/iterative/thermal/diningRoom/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);










clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/thermal/park/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/thermal/park/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/thermal/park/';
net_pa = '~/projects/matrix/network/iterative/thermal/park/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 5);


