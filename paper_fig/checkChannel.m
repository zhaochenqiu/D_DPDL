function re_im = checkChannel(im)

[row_im column_im byte_im] = size(im);

if byte_im == 1
    re_im = zeros(row_im, column_im, 3);

    re_im(:, :, 1) = im;
    re_im(:, :, 2) = im;
    re_im(:, :, 3) = im;
else
    re_im = im;
end
