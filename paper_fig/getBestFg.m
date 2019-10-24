function [re_im re_gt re_fg] = getBestFg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft)

[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);
[files_fg fullfiles_fg] = loadFiles_plus(fg_pa, fg_ft);


frames = max(size(fullfiles_im));



maxfm = 0;
index = 0;

for i = 1:frames
    fgim = double(imread(fullfiles_fg{i}));
    gtim = double(imread(fullfiles_gt{i}));


    [TP FP FN TN] = evalution_entry(fgim, gtim);

    Re = TP/(TP + FN);
    Pr = TP/(TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);


    pvalue = sum(sum(gtim == 255));
    nvalue = sum(sum(gtim == 0));
    [row_im column_im byte_im] = size(gtim);
    rate = pvalue/row_im*column_im;


    if Fm*(rate)^2 > maxfm
        maxfm = Fm*(rate)^2;
        index = i;
    end
end


re_im = double(imread(fullfiles_im{index}));
re_gt = double(imread(fullfiles_gt{index}));
re_fg = double(imread(fullfiles_fg{index}));
