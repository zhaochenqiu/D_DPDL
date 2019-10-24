clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('~/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

rng(0)


im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
im_ft = 'jpg';


gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
gt_ft = 'png';


net_pa = '../network/net_test/net-epoch-20.mat'


size_block = 9;
rag_block = 0;

imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, 1140, 9);
% imdb = getImdb_test(im_pa, im_ft, gt_pa, gt_ft, 1140, 81, 0);


% bgs_train(imdb,'net_test');
bgs_train(imdb,'../network/net_test2/');



net = load(net_pa);
net = net.net;

[fgim gtim] = getFgImg(net, imdb);


[TP FP FN TN] = evalution_entry(fgim,gtim);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);
Fm

figure
displayMatrixImage(1,1,2,fgim,gtim)
