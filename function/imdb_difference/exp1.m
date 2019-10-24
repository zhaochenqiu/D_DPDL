clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('../../function/');

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

% fg_pa = '../../../result/';
fg_pa = '../../../detection/iterative/baseline/highway/iteration_01_net2fg/';
% fg_pa = '../../../detection/iterative/dynamicBackground/fountain01/iteration_01_net2fg/';
% fg_pa = '../../../detection/iterative/baseline/PETS2006/iteration_01_net2fg/';

fg_ft = 'png';

% tr_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
tr_pa = '../../../detection/iterative/baseline/highway/iteration_01_fg2bay/';
% tr_pa = '../../../detection/iterative/dynamicBackground/fountain01/iteration_01_fg2bay/';
% tr_pa = '../../../detection/iterative/baseline/PETS2006/iteration_01_fg2bay/';

tr_ft = 'png';


list = getDiff(fg_pa, fg_ft, tr_pa, tr_ft);

poslist = find(list > mean(list));

poslist = poslist(randperm(max(size(poslist))));


num_retrain = 50;
frames_idxs = poslist(1:num_retrain);


radius = 25;


tic
imdb_set = {};
for i = 1:max(size(frames_idxs))
    imdb = getImdb_byDiff(im_pa, im_ft, fg_pa, fg_ft, tr_pa, tr_ft, frames_idxs(i), radius^2);

    imdb_set = {imdb_set{:}, imdb};
    i
end

imdb = mixImdb(imdb_set{:});
t = toc






% 
% frames = max(size(list));
% x = 1:frames;
% 
% figure
% plot(x, list, '.:b');
% 






% 
% 
% [fglist bklist] = getFgBkDiff(fg_pa, fg_ft, tr_pa, tr_ft);
% 
% 
% frames = max(size(fglist));
% 
% x = 1:frames;
% 
% figure
% plot(x, fglist, '.:b')
% 
% figure
% plot(x, bklist, '.:r')



% frame_index = 1482;
% radius = 81;
% 
% re_imdb = getImdb_byDiff(im_pa, im_ft, fg_pa, fg_ft, tr_pa, tr_ft, frame_index, radius);





