function [re_idxes re_rates] = selectRandFgFrame(im_pa, im_ft, nums, minrate)

if nargin == 2
    nums  = 5;
    minrate = 0;
end

if nargin == 3
    minrate = 0;
end

[fs_im fullfs_im] = loadFiles_plus(im_pa, im_ft);

frames = max(size(fullfs_im));


mat_rat = zeros(frames, 2);

for i = 1:frames
    fg = double(imread(fullfs_im{i}));

    idx0 = fg == 0;
    idx1 = fg == 255;

    value = sum(sum(idx1))/( sum(sum(idx0)) + sum(sum(idx1)) );

    mat_rat(i, 1) = i;
    mat_rat(i, 2) = value;
end

rat = mat_rat(:, 2);
pos = mat_rat(:, 1);

idx = rat > minrate;

rat = rat(idx);
pos = pos(idx);

idx = randperm(max(size(rat)), nums);

re_idxes = pos(idx);
re_rates = rat(idx);





