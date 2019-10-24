function [re_idxes re_rates] = selectFgRand(fg_pa, fg_ft, num, rate)


if nargin == 2
    num = 2;
    rate = 1;
end

if nargin == 3
    rate = 1;
end

[fs_im fullfs_im] = loadFiles_plus(fg_pa, fg_ft);
size(fs_im)
fg_pa

im = double(imread(fullfs_im{1}));
[row_im column_im byte_im] = size(im);



frames = max(size(fullfs_im));

mat = zeros(frames, 2);

for i = 1:frames
    fgim = double(imread(fullfs_im{i}));
    
    idx_fg = fgim == 255;
    idx_bk = fgim == 0;

    fgval = sum(sum(idx_fg));
    bkval = sum(sum(idx_bk));

    mat(i, 1) = fgval;
    mat(i, 2) = bkval;
end

pos_peak = getFgPeakFrames_rand(fg_pa, fg_ft, 10000000, 2);
% pos_peak

pos_res = [];
for t = 1:max(size(pos_peak))
    pos_res = [pos_res pos_peak(t) - 2:1:pos_peak(t) + 2];
end

pos_res(pos_res < 1) = 1;
pos_res(pos_res > max(size(mat))) = max(size(mat));

pos_peak = unique(pos_res)';

list = mat(pos_peak, 1);
val = mean(list);
pos = pos_peak(list > val*rate);

% pos
% 
% sort(pos)





pos = pos(randperm(numel(pos)));
pos = pos(randperm(numel(pos)));
pos = pos(randperm(numel(pos)));


num = min([max(size(pos)) num]);


re_idxes = pos(1:num);
re_rates = [];
