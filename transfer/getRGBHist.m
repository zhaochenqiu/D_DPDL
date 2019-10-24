function re_hist = getRGBHist(im)


[row_im column_im byte_im] = size(im);
rim = im(:, :, 1);
gim = im(:, :, 2);
bim = im(:, :, 3);


rh = hist(reshape(rim, 1, row_im*column_im), 1:255);
gh = hist(reshape(gim, 1, row_im*column_im), 1:255);
bh = hist(reshape(bim, 1, row_im*column_im), 1:255);

re_hist = [rh gh bh];

% hl = [rhl ghl bhl];
