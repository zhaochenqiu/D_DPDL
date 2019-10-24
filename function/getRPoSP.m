function re_imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, curindex, num, mode)

if nargin == 6
    mode = 'test';
end


[im_fn im_ffn] = loadFiles_plus(im_pa, im_ft);
[gt_fn gt_ffn] = loadFiles_plus(gt_pa, gt_ft);


curim = double(imread(im_ffn{curindex}));
labim = double(imread(gt_ffn{curindex}));

[row_im column_im byte_im] = size(curim);



radius = round(num/2 - 0.5);
extim = padarray(curim, [radius radius], 'symmetric');
extgt = padarray(labim, [radius radius], 'symmetric');

[row_et column_et byte_et] = size(extim);


% ----------------------------------------------------------------------------------%
% ----------------------------------------------------------------------------------%
% get the spatio information                                                        %
% ----------------------------------------------------------------------------------%
data_sp = zeros(num, num, byte_im, row_im*column_im, 'single');                     %
                                                                                    %
for i = radius + 1:row_et - radius                                                  %
    for j = radius + 1:column_et - radius
        pos = (i - radius - 1)*row_im + j - radius;
        
        entim = extim(i - radius:i + radius, j - radius:j + radius, :);
        pixel = extim(i,j,:);

        entim(:,:,1) = entim(:,:,1) - pixel(1);
        entim(:,:,2) = entim(:,:,2) - pixel(2);
        entim(:,:,3) = entim(:,:,3) - pixel(3);

        data_sp(:,:,:,pos) = entim;
    end                                                                             %
end                                                                                 %
% ----------------------------------------------------------------------------------%
% ----------------------------------------------------------------------------------%


% ----------------------------------------------------------------------------------%
% ----------------------------------------------------------------------------------%
% mix the spatio and temporal information                                           %
% ----------------------------------------------------------------------------------%
data_RPoSP = zeros(num, num, byte_im, row_im*column_im, 'single');                %
[row_t column_t byte_t frames_t] = size(data_RPoSP);                                %

% XXX 这里没想清楚，是应该分开随机，还是独立一期随机？ 
% XXX 为了方便和加速，现在就一起随机了

for i = 1:frames_t
    ranidx = randperm(row_t*column_t);

    for j = 1:byte_im
        im = data_sp(:,:,j,i);
        data_sp(:,:,j,i) = reshape(im(ranidx), row_t, column_t);
    end

    data_RPoSP(:,:,:,i) = data_sp(:,:,:,i);
end                                                                                 %
% ----------------------------------------------------------------------------------%
% ----------------------------------------------------------------------------------%


labim = labim';
labs_RPoSP = reshape(labim,1,row_im*column_im);
labs_RPoSP(labs_RPoSP == 0) = 1;


if strcmp(mode, 'train') == 1
    index = (labs_RPoSP == 1 | labs_RPoSP == 255);
    labs_RPoSP = labs_RPoSP(index);
    data_RPoSP = data_RPoSP(:,:,:,index);

    count = sum(index);
    count = round(count/100 - 0.5)*100;

    data_RPoSP = data_RPoSP(:,:,:,1:count);
    labs_RPoSP = labs_RPoSP(1:count);
end

len = max(size(data_RPoSP));
ranidx = randperm(len);

data_RPoSP = data_RPoSP(:,:,:,ranidx);
labs_RPoSP = labs_RPoSP(ranidx);


line        = 1:max(size(ranidx));
matrix      = [line' ranidx'];
index       = sortrows(matrix,2);
recoveridx  = index(:,1);


re_imdb.images.data     = single(data_RPoSP);
re_imdb.images.labels   = single(labs_RPoSP);
re_imdb.images.imgsize  = [row_im column_im byte_im];
re_imdb.images.index    = recoveridx;
re_imdb.images.set      = zeros( 1, max(size(data_RPoSP)), 'single') + 1;
re_imdb.images.data_mean = mean(data_RPoSP,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};



