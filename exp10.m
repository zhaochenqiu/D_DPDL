clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('~/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

% rng(0)


% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
% im_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';





% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
% gt_ft = 'png';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/projects/matrix/result/';
gt_ft = 'png';


net_path = '../network/net_loop/';
net_pa = [net_path 'net-epoch-1080.mat'];
% net_pa = '../network/net_test/net-epoch-400.mat'

% imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, 1630, 9);
% imdb = getImdb_test(im_pa, im_ft, gt_pa, gt_ft, 1140, 81, 0);
imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, 1480, 81, 'train', 'set');
imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');

% bgs_train(imdb,'net_test');
bgs_train(imdb,net_path);




gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_pa = '~/projects/matrix/result/';
gt_ft = 'png';

% imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, 1000, 81);





store_temp = [];




imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, 1480, 81, 'test', 'set');



for i = 1:10
    imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');


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



% Fm

figure
displayMatrixImage(1,1,2,fgim,gtim)

str = sprintf('re%06d',1480);
str = [str '.png'];
saveImage(fgim, './result/', str);
