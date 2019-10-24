function [re_fgimg re_trimg]= getFgImg(net,imdb,batchsize)

if nargin == 2
    batchsize = 5000;
end


data = imdb.images.data;
labs = imdb.images.labels;

olddata = data;
oldlabs = labs;



data = abs(data);
data = sum(data, 1);
data = sum(data, 2);
data = sum(data, 3);
data = squeeze(data);


meanvalue = mean(data);


index_mayfg = data > meanvalue*1;
index_maybk = ~index_mayfg;


data = olddata(:, :, :, index_mayfg);
labs = oldlabs(index_mayfg);

global g_index_mayfg
g_index_mayfg = index_mayfg;




detectlabs = abs(labs - labs);

len = max(size(labs));
num = round(len/batchsize - 0.5);

global g_gpuId


if isempty(g_gpuId) ~= 1
    gpuDevice(g_gpuId);
end


net = vl_simplenn_move(net, 'gpu') ;
opts.mode = 'test';

right = 0;

res = [];
for i = 1:num
    left = (i - 1)*batchsize + 1;
    right = i*batchsize;

    im = data(:,:,:,left:right);
    im = gpuArray(im);

    res = vl_simplenn_nosoft(net,im,[],[],opts);
%    res = vl_simplenn_nosoft(net,im,[],[],opts);
%    res = vl_simplenn_nosoft(net,im,[],[],opts);
%    res = vl_simplenn_temp(net, im, [], [], opts);


    resdata = gather(res(end - 1).x);
%    resdata = res(end - 1).x;

    reslb = data2labs(resdata);
    detectlabs(left:right) = reslb;
%    [i num]
end



im = data(:,:,:,right+1:end);
if min(size(im)) > 0
    im = gpuArray(im);
    res = vl_simplenn_nosoft(net,im);

    resdata = gather(res(end - 1).x);

    reslb = data2labs(resdata);
    detectlabs(right+1:end) = reslb;
end

global g_res
g_res = res;


% global g_labs g_detectlabs;
% g_labs = labs;
% g_detectlabs = detectlabs;



index = imdb.images.index;


row_img = imdb.images.imgsize(1);
column_img = imdb.images.imgsize(2);



reallab = abs(oldlabs - oldlabs);
reallab(index_mayfg) = detectlabs;
reallab(index_maybk) = 0;

global g_reallab
g_reallab = reallab;


labs = oldlabs;
detectlabs = reallab;



labs = labs(index);
detectlabs = detectlabs(index);


resimg = reshape(detectlabs,column_img,row_img);
srcimg = reshape(labs,column_img,row_img);


index = resimg == 1;
resimg(index) = 0;

index = srcimg == 1;
srcimg(index) = 0;


re_fgimg = resimg';
re_trimg = srcimg';
