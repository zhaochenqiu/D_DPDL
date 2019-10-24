function [idx re_value] = selectBalFrame(im_pa, im_ft, rate)

if nargin == 2
    rate = 0.35;
end


[fs_im fullfs_im] = loadFiles_plus(im_pa, im_ft);

frames = max(size(fullfs_im));

distance = 100;
idx = -1;
re_value = 0;

for i = 1:frames
    fg = double(imread(fullfs_im{i}));

    idx0 = fg == 0;
    idx1 = fg == 255;

    sumvalue = sum(sum(idx0)) + sum(sum(idx1));
    value = sum(sum(idx1))/( sum(sum(idx0)) + sum(sum(idx1)) );

    if abs(value - rate) < distance
        distance = abs(value - rate);
        idx = i;
        re_value = value;
    end
end
