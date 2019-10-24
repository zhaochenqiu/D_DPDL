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
im_pa = '~/dataset/MRC/imagesp_small/';

im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';
gt_pa = '~/dataset/MRC/imagesp_small/groundtruth/';

gt_ft = 'png';


net_path = '../network/net_random_each_epoch/';
net_path = '../network/net_random_pedestrains/';
net_path = '../network/net_random_office/';
net_path = '../network/net_random_PETS2006/';
net_path = '../network/net_random_MRC_small/';

net_name = [net_path 'net-epoch-60.mat'];

radius = 9;
idx_num = idx;

imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx_num, radius^2, 'train', 'set');
imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');


bgs_train_random(imdb, net_path);



% test the performance
imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx_num, radius^2, 'test', 'set');

net = load(net_name);
net = net.net;

store_temp = [];

for i = 1:10
    imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');


    [fgim gtim] = getFgImg(net, imdb);


    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    temp = [Re Pr Fm]
    store_temp = [store_temp; temp];
end

store_temp

path_save = '../detection/mrc/';


figure
for i = 1:frames

	if i < 100
		fgim = zeros(row_im, column_im);
		displayMatrixImage(i,1,2,fgim,fgim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, path_save, str);
	else

		imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, i, 81);

		[fgim gtim] = getFgImg(net, imdb);


		[TP FP FN TN] = evalution_entry(fgim,gtim);

		Re = TP/(TP + FN);
		Pr = TP / (TP + FP);
		Fm = (2*Pr*Re)/(Pr + Re);
		Fm

		storage_fm = [storage_fm; Re Pr Fm];

		displayMatrixImage(i,1,2,fgim,gtim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, path_save, str);
	end
end




mean(storage_fm)
