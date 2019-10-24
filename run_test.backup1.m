clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('/data/projects/matrix/common/');
addpath('./function/')

rng(0)


im_pa = '/data/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
im_ft = 'jpg';


gt_pa = '/data/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
gt_ft = 'png';


net_pa = '/data/projects/net_3.0/net/dynamicBackground/fountain01_9/net-epoch-40.mat';




size_block = 9;
rag_block = 0;

tic
imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, 1140, 9);
time = toc;
time


net = load(net_pa);
net = net.net;


[fgim gtim] = getFgImg(net,imdb);


figure
displayMatrixImage(1,1,2,fgim,gtim)



% input('pause')
% 
% 
% 
% labs = imdb.images.labels;
% idx = imdb.images.index;
% imgsize = imdb.images.imgsize;
% 
% row_im      = imgsize(1);
% column_im   = imgsize(2);
% byte_im     = imgsize(3);
% 
% figure
% imshow(uint8(reshape(labs(idx), column_im, row_im )));
% 



