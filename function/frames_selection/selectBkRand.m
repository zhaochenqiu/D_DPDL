function [re_idxes re_rates] = selectPoFgRand(fg_pa, fg_ft, num)


if nargin == 2
    num = 2;
end


[fs_im fullfs_im] = loadFiles_plus(fg_pa, fg_ft);

im = double(imread(fullfs_im{1}));
[row_im column_im byte_im] = size(im);



frames = max(size(fullfs_im));

mat = zeros(frames, 1);


for i = 1:frames
    fgim = double(imread(fullfs_im{i}));
    
    idx_fg = fgim == 255;
    idx_bk = fgim == 0;

    fgval = sum(sum(idx_fg));
    bkval = sum(sum(idx_bk));

    mat(i) = fgval + bkval;
end

pos = find(mat ~= 0);

pos = pos(randperm(numel(pos)));
pos = pos(randperm(numel(pos)));
pos = pos(randperm(numel(pos)));


re_idxes = pos(1:num);
re_rates = [];
