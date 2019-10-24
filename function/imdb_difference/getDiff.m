function re_list = getDiff(fg_pa, fg_ft, tr_pa, tr_ft)


[fg_fs temp] = loadData_files(fg_pa, fg_ft);
[tr_fs temp] = loadData_files(tr_pa, tr_ft);

frames = max(size(fg_fs));

re_list = zeros(1, frames);


for i = 1:frames
    fgim = double(imread([fg_pa '/' fg_fs{i}]));
    trim = double(imread([tr_pa '/' tr_fs{i}]));

    posidx_tr = trim == 255;
    negidx_fg = fgim == 0;

    posidx_fg = fgim == 255;
    negidx_fg = fgim == 0;

    posidx_tr = trim == 255;
    negidx_tr = trim == 0;


%    re_list(i) = sum(sum(fgim ~= trim));
    re_list(i) = sum(sum(posidx_tr & negidx_fg));
end
