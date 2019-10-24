function [re_idx re_gt] = pickFrame(gt_pa, gt_ft)

[files fullfiles] = loadFiles_plus(gt_pa, gt_ft);

frames = max(size(fullfiles));


store_pos = -1;
store_num = -1;
re_gt = [];

for i = 1:frames
    gtim = double(imread(fullfiles{i}));

    idx_num = gtim == 255;

    num = sum(sum(idx_num));

    if num > store_num
        store_num = num;
        store_pos = i;
        re_gt = gtim;
    end
end

re_idx = store_pos;
