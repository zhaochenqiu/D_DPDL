clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('./function/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')




% pick up the appropriate frame
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';

% gt_pa ='../detection/bayes_10/pedestrains/';
gt_pa = '../detection/fg2bayes_it1/pedestrians/';
gt_pa = '../detection/fg2bayes_it2/pedestrains/';
gt_ft = 'png';

[idx gt]= pickFrame(gt_pa, gt_ft);

num_trainframes = 20;

list_fg = getFgPeakFrames(gt_pa, gt_ft, num_trainframes/2, 2);
list_sq = getSqFrames(    gt_pa, gt_ft, num_trainframes/2);

% 生成的fg有问题，前100帧应该是全灰的
% 之后再说，现在直接更改
% list_sq(1) = 300;

list_train = [list_fg; list_sq];


% training the network
% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';

im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';

im_ft = 'jpg';

% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';

%gt_pa ='../detection/bayes_10/pedestrains/';
gt_pa = '../detection/fg2bayes_it2/pedestrains/';
gt_ft = 'png';


% net_path = '../network/net_random_each_epoch/';
% net_path = '../network/net_random_pedestrains/';
% net_path = '../network/net_random_office/';
% net_path = '../network/net_random_PETS2006/';

net_path = '../network/net_recursive_it3/pedestrains/'

net_name = [net_path 'net-epoch-100.mat'];

radius = 9;
idx_num = idx;

imdb = getMultiRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, list_train, radius^2, 'train', 'set');
imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'get');

bgs_train_multi_random(imdb, net_path);


% test the performance
imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, list_fg(2), radius^2, 'test', 'set');

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

