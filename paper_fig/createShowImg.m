function re_im = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen)



[im gtim fgim] = getBestFg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft);
[files_tim fullfiles_tim] = loadFiles_plus(tim_pa, tim_ft);

frames = max(size(fullfiles_tim));
index = randperm(frames);
index = index(1);

tim = double(imread(fullfiles_tim{index}));

% displayMatrixImage(1, 1, 4, tim, im, gtim, fgim);





im = scaleImage_byWidth(im, entry_width);
gtim = scaleImage_byWidth(gtim, entry_width);
fgim = scaleImage_byWidth(fgim, entry_width);

[row_im column_im byte_im] = size(im);

tim = scaleImage_byHeight(tim, row_im);


im      = checkChannel(im);
gtim    = checkChannel(gtim);
fgim    = checkChannel(fgim);
tim     = checkChannel(tim);


im      = extendImg(im, column_im);
gtim    = extendImg(gtim, column_im);
fgim    = extendImg(fgim, column_im);
tim     = extendImg(tim, column_im);



vborder = zeros(row_im, vlen, 3) + 255;

finim = [tim vborder im vborder gtim vborder fgim];

[row_fim column_fim byte_fim] = size(finim);

hborder = zeros(hlen, column_fim, 3) + 255;

finim = [finim; hborder];

re_im = finim;
