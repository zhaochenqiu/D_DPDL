clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('~/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

rng(0)


% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
% im_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';





% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
% gt_ft = 'png';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';





size_block = 9;
rag_block = 0;

% imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, 1630, 9);
% imdb = getImdb_test(im_pa, im_ft, gt_pa, gt_ft, 1140, 81, 0);


% bgs_train(imdb,'net_test');
% bgs_train(imdb,'../network/net_test/');


[files fullfiles] = loadFiles_plus(im_pa, im_ft);







net_pa = '../network/net_test/net-epoch-200.mat'


net = load(net_pa);
net = net.net;


[files fullfiles] = loadFiles_plus(im_pa, im_ft);

frames = max(size(files));



imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, 1000, 81);


batchsize = 4000;

data = imdb.images.data;
labs = imdb.images.labels;

[row column] = size(labs);
detectlabs = zeros(2, column);



len = max(size(labs));
num = round(len/batchsize - 0.5);

net = vl_simplenn_move(net, 'gpu') ;
opts.mode = 'test';
for i = 1:num
    left = (i - 1)*batchsize + 1;
    right = i*batchsize;

    im = data(:,:,:,left:right);
    im = gpuArray(im);

%    res = vl_simplenn_nosoft(net,im,[],[],opts);
    res = vl_simplenn_nosoft(net,im,[],[],opts);

    resdata = gather(res(end - 1).x);
%    resdata = res(end - 1).x;

    reslb = data2labs_pra(resdata);
    detectlabs(:, left:right) = reslb;
%    [i num]
end



im = data(:,:,:,right+1:end);
if min(size(im)) > 0
    im = gpuArray(im);
    res = vl_simplenn_nosoft(net,im);

    resdata = gather(res(end - 1).x);

    reslb = data2labs_pra(resdata);
    detectlabs(:, right+1:end) = reslb;
end

index = imdb.images.index;


row_img = imdb.images.imgsize(1);
column_img = imdb.images.imgsize(2);


labs = labs(index);
detectlabs = detectlabs(:,index);



resimg_neg = reshape(detectlabs(1, :),column_img,row_img);
resimg_pos = reshape(detectlabs(2, :),column_img,row_img);

srcimg = reshape(labs,column_img,row_img);


resimg_neg = resimg_neg';
resimg_pos = resimg_pos';
subimg = resimg_pos - resimg_neg;


srcimg = srcimg';


resimg_neg = visNPImg(resimg_neg)*10;
resimg_pos = visNPImg(resimg_pos)*10;
subimg_vis = visNPImg(subimg)*10;


img = double(imread(fullfiles{1000}));

figure
displayMatrixImage(1, 1, 5, resimg_neg, resimg_pos, srcimg, subimg_vis)






% figure
% displayMatrixImage(1,1,2, re_fgimg*10, re_trimg)
