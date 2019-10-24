function [re_FN_fg_list re_FP_bk_list] = getFgBkDiff(fg_pa, fg_ft, tr_pa, tr_ft)


[fg_fs temp] = loadData_files(fg_pa, fg_ft);
[tr_fs temp] = loadData_files(tr_pa, tr_ft);


frames = max(size(fg_fs));


re_FN_fg_list = zeros(1, frames);
re_FP_bk_list = zeros(1, frames);


for i = 1:frames
    fgim = double(imread([fg_pa '/' fg_fs{i}]));
    trim = double(imread([tr_pa '/' tr_fs{i}]));


    posidx_fg = fgim == 255;
    negidx_fg = fgim == 0;

    posidx_tr = trim == 255;
    negidx_tr = trim == 0;


    re_FN_fg_list(i) = sum(sum(negidx_fg & posidx_tr));
    re_FP_bk_list(i) = sum(sum(posidx_fg & negidx_tr));
end
