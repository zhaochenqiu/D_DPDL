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

im_ft = 'bmp';
gt_ft = 'png';




im_pa='~/dataset/LASIESTA/O_RA_01/O_RA_01/';
gt_pa='~/dataset/LASIESTA/O_RA_01/O_RA_01-GT/';
fg_pa = '~/projects/matrix/detection/iterative/LAS/O_RA_01/';
net_pa =  '~/projects/matrix/network/iterative/LAS/O_RA_01/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);





clear all
close all
clc

im_ft = 'bmp';
gt_ft = 'png';




im_pa='~/dataset/LASIESTA/O_RA_02/O_RA_02/';
gt_pa='~/dataset/LASIESTA/O_RA_02/O_RA_02-GT/';
fg_pa = '~/projects/matrix/detection/iterative/LAS/O_RA_02/';
net_pa =  '~/projects/matrix/network/iterative/LAS/O_RA_02/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);





clear all
close all
clc

im_ft = 'bmp';
gt_ft = 'png';




im_pa='~/dataset/LASIESTA/O_SN_01/O_SN_01/';
gt_pa='~/dataset/LASIESTA/O_SN_01/O_SN_01-GT/';
fg_pa = '~/projects/matrix/detection/iterative/LAS/O_SN_01/';
net_pa =  '~/projects/matrix/network/iterative/LAS/O_SN_01/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);





clear all
close all
clc

im_ft = 'bmp';
gt_ft = 'png';




im_pa='~/dataset/LASIESTA/O_SN_02/O_SN_02/';
gt_pa='~/dataset/LASIESTA/O_SN_02/O_SN_02-GT/';
fg_pa = '~/projects/matrix/detection/iterative/LAS/O_SN_02/';
net_pa =  '~/projects/matrix/network/iterative/LAS/O_SN_02/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);





clear all
close all
clc

im_ft = 'bmp';
gt_ft = 'png';




im_pa='~/dataset/LASIESTA/O_SU_01/O_SU_01/';
gt_pa='~/dataset/LASIESTA/O_SU_01/O_SU_01-GT/';
fg_pa = '~/projects/matrix/detection/iterative/LAS/O_SU_01/';
net_pa =  '~/projects/matrix/network/iterative/LAS/O_SU_01/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc

im_ft = 'bmp';
gt_ft = 'png';




im_pa='~/dataset/LASIESTA/O_SU_02/O_SU_02/';
gt_pa='~/dataset/LASIESTA/O_SU_02/O_SU_02-GT/';
fg_pa = '~/projects/matrix/detection/iterative/LAS/O_SU_02/';
net_pa =  '~/projects/matrix/network/iterative/LAS/O_SU_02/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




