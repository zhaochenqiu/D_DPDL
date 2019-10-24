function re_idx = selectFg_hierarchy(fg_pa, fg_ft, nums)


[fs_fg fullfs_fg] = loadFiles_plus(fg_pa, fg_ft);

maxlen = max(size(fullfs_fg));

re_idx = [];

while max(size(re_idx)) < nums
    peakpts = getFgPeakFrames_rand(fg_pa, fg_ft, nums, maxlen);

    re_idx = [re_idx; peakpts];

    re_idx = unique_unsorted(re_idx);


    maxlen = round(maxlen*0.4);
    maxlen = max([maxlen 2]);
end


re_idx = re_idx(1:nums);
