function re_imdb = getImdb_byDiff(im_pa, im_ft, fg_pa, fg_ft, tr_pa, tr_ft, frame_index, radius)

[im_fs temp] = loadData_files(im_pa, im_ft);
[fg_fs temp] = loadData_files(fg_pa, fg_ft);
[tr_fs temp] = loadData_files(tr_pa, tr_ft);


im = imread([im_pa '/' im_fs{1}]);

[row_im column_im byte_im] = size(im);


data_im = zeros(row_im, column_im, byte_im, radius, 'uint8');


count = 1;

list = 1:(frame_index - 1);
list = list(randperm(max(size(list))));
index = zeros(1, radius);

len = max(size(list));

for i = 1:radius
    index(i) = list(mod(i, len) + 1);
end


for i = 1:max(size(index))
    fprintf(1, 'Reading file %d: %s\r', i, im_fs{index(i)});

    im = imread([im_pa '/' im_fs{index(i)}]);

    data_im(:, :, :, count) = im;

    count = count + 1;
end


block_im = single(data_im);

curim = double(imread([im_pa '/' im_fs{frame_index}]));


[row_t column_t byte_t frames_t] = size(block_im);

for i = 1:frames_t
    block_im(:, :, :, i) = block_im(:, :, :, i) - curim;
end

block_im = permute(block_im, [4 3 2 1]);

data_im = reshape(block_im, radius^(0.5), radius^(0.5), byte_t, row_t*column_t);


fgim = double(imread([fg_pa '/' fg_fs{frame_index}]));
trim = double(imread([tr_pa '/' tr_fs{frame_index}]));

% captured the indexes of difference
%idx = fgim ~= trim;

idx = (fgim == 0 & trim == 255) | (fgim == 255 & trim == 0);

idx = idx';
idx_diff = reshape(idx, 1, row_t*column_t);


labim = trim;
labim = labim';
labs = reshape(labim, 1, row_t*column_t);
labs(labs == 0) = 1;

data_diff = data_im(:, :, :, idx_diff);
labs_diff = labs(:, idx_diff);


[row_t column_t byte_t frames_t] = size(data_diff);

for i = 1:frames_t
    tempindex = randperm(row_t*column_t);
    for j = 1:byte_t
        im = data_diff(:,:,j,i);

        data_diff(:,:,j,i) = reshape(im(tempindex),row_t,column_t);
    end
end


idx = randperm(frames_t);
lsq = 1:max(size(idx));

data_diff = data_diff(:, :, :, idx);
labs = labs(idx);

matrix = [lsq' idx'];
idx = sortrows(matrix, 2);
idx = idx(:, 1);


templen = max(size(data_diff));

re_imdb.images.data     = single(data_diff);
re_imdb.images.labels   = single(labs);
re_imdb.images.imgsize  = [row_im column_im byte_im];
re_imdb.images.index    = idx;
re_imdb.images.set      = zeros(1,templen,'single') + 1;
re_imdb.images.data_mean = mean(data_diff,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};
