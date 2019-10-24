clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('~/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

% rng(0)


im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';


% imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode);

imdb = getRPoSP_SG(im_pa, im_ft, gt_pa, gt_ft, 1640, 9, 'train', 'set');
imdb = getRPoSP_SG([], [], [], [], [], [], [],'get');


net_path = '../network/network_sp/';
net_pa = [net_path 'net-epoch-20.mat'];

bgs_train_sp(imdb,net_path);



imdb = getRPoSP_SG(im_pa, im_ft, gt_pa, gt_ft, 1640, 9, 'test', 'set');

store_temp = [];

for i = 1:10
    imdb = getRPoSP_SG([], [], [], [], [], [], [],'get');


    net = load(net_pa);
    net = net.net;

    [fgim gtim] = getFgImg(net, imdb);


    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    temp = [Re Pr Fm]
    store_temp = [store_temp; temp];
end

store_temp


figure
displayMatrixImage(1,1,2,fgim,gtim)

str = sprintf('re%06d',1640);
str = [str '.png'];
saveImage(fgim, './result/', str);
