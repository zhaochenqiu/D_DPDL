clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('~/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

rng(0)


im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';

im_ft = 'jpg';


gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';

gt_ft = 'png';



net_path = '../network/net_random_each_epoch/';
net_path = '../network/net_random_office/';
net_path = '../network/net_random_PETS2006/';
net_name = [net_path 'net-epoch-100.mat'];


net = load(net_name);
net = net.net;


[files fullfiles] = loadFiles_plus(im_pa, im_ft);

frames = max(size(files));

[row_im column_im byte_im] = size(double(imread(fullfiles{1})));

storage_fm = [];

% path_save = '../detection/random_epoch_highway/';
path_save = '../detection/random_epoch/highway_60/';
path_save = '../detection/random_epoch/office_60/';
path_save = '../detection/random_epoch/PETS2006_100/'

figure
for i = 1:frames

	if i < 100
		fgim = zeros(row_im, column_im);
%		displayMatrixImage(i,1,2,fgim,fgim)

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

%		displayMatrixImage(i,1,2,fgim,gtim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, path_save, str);
	end
end




mean(storage_fm)
