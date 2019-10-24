function re_imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode)

if nargin == 6
    mode = 'test';
end


[im_fn im_ffn] = loadFiles_plus(im_pa, im_ft);
[gt_fn gt_ffn] = loadFiles_plus(gt_pa, gt_ft);


curim = double(imread(im_ffn{curindex}));
labim = double(imread(gt_ffn{curindex}));

[row_im column_im byte_im] = size(curim);


data = zeros(row_im,column_im,byte_im,num*num,'uint8');
index = round(linspace(1,curindex - 1,num*num));

for i = 1:max(size(index))
    data(:,:,:,i) = double(imread(im_ffn{index(i)})) - curim;
end

block_im = single(data);
block_im = permute(block_im,[4 3 2 1]);


data = reshape(block_im, num, num, byte_im, row_im*column_im);
labim = labim';
labs = reshape(labim,1,row_im*column_im);
labs(labs == 0) = 1;


if strcmp(mode, 'train') == 1
    index = (labs == 1 | labs == 255);
    labs = labs(index);
    data = data(:,:,:,index);

%     count = sum(tempindex);
    count = sum(index);
    count = round(count/100 - 0.5)*100;

    data = data(:,:,:,1:count);
    labs = labs(1:count);
end

% if strcmp(mode, 'test') == 1
% end


len = max(size(data));
index = randperm(len);

data = data(:,:,:,index);
labs = labs(index);


line        = 1:max(size(index));
matrix      = [line' index'];
index       = sortrows(matrix,2);
recoveridx  = index(:,1);



[row_t column_t byte_t frames_t] = size(data);

for i = 1:frames_t
    tempindex = randperm(row_t*column_t);
    for j = 1:byte_t
        im = data(:,:,j,i);
        
        data(:,:,j,i) = reshape(im(tempindex),row_t,column_t);
    end
end


re_imdb.images.data     = single(data);
re_imdb.images.labels   = single(labs);
re_imdb.images.imgsize  = [row_im column_im byte_im];
re_imdb.images.index    = recoveridx;
re_imdb.images.set      = zeros( 1, max(size(data)), 'single') + 1;
re_imdb.images.data_mean = mean(data,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};
