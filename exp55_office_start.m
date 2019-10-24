clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('./function/');
addpath('./function/frames_selection/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')




% pick up the appropriate frame
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';

gt_ft = 'png';

idx = selectBalFrame(gt_pa, gt_ft);


im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
im_ft = 'jpg';


gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
gt_ft = 'png';


net_path = '../network/iteration_01/baseline/office/';

net_name = [net_path 'net-epoch-60.mat'];

radius = 9;
idx_num = idx;

imdb = getMultiRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'train', 'set');
imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'get');

bgs_train_multi_random(imdb, net_path);


% test the performance
imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'test', 'set');

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

