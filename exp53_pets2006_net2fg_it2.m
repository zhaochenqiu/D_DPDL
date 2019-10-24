clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('~/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

rng(0)


im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';
im_ft = 'jpg';


gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';
gt_ft = 'png';



net_path = '../network/net_random_each_epoch/';
net_path = '../network/net_random_pedestrains/';
net_path = '../network/net_recursive/pedestrains/';
net_path = '../network/net_recursive_it2/PETS2006/';
%net_name = [net_path 'net-epoch-60.mat'];
net_name = [net_path 'net-epoch-45.mat'];



net = load(net_name);
net = net.net;


[files fullfiles] = loadFiles_plus(im_pa, im_ft);

frames = max(size(files));

[row_im column_im byte_im] = size(double(imread(fullfiles{1})));

storage_fm = [];
store_entry = [];

% path_save = '../detection/random_epoch_highway/';
path_save = '../detection/random_epoch/highway_60/';
path_save = '../detection/random_epoch/pedestrains_60/';
path_save = '../detection/net2fg_it2/pedestrains/';
path_save = '../detection/net2fg_it2/PETS2006/';

figure
for i = 1:frames

	if i < 300
		fgim = zeros(row_im, column_im) + 85;
		displayMatrixImage(i,1,2,fgim,fgim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, path_save, str);
	else

		imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, i, 81);

		[fgim gtim] = getFgImg(net, imdb);


		[TP FP FN TN] = evalution_entry(fgim,gtim);

        store_entry = [store_entry; TP FP FN TN];


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


list = sum(store_entry, 1);
TP = list(1);
FP = list(2);
FN = list(3);
TN = list(4);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

value = [Re Pr Fm]

txtWrite(value, 'temp.txt');

% load train
% load laughter
% load handel
load chirp
sound(y,Fs)
