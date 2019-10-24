function re_list = getTempROI(gt_pa, gt_ft)

[fs fullfs] = loadFiles_plus(gt_pa, gt_ft);

frames = max(size(fullfs));

re_list = zeros(frames, 1);


for i = 1:frames
    gt = double(imread(fullfs{i}));

    idx_fg = gt == 255;
    idx_bk = gt == 0;

    re_list(i) = sum(sum(idx_fg)) + sum(sum(idx_bk));
end



