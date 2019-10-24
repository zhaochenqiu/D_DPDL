function re_im = extendImg(im, width)


[row_im column_im byte_im] = size(im);

len = width - column_im;

if len < 0
    len = 0;
end

len = round(len/2);

border = zeros(row_im, len, 3) + 255;
re_im = [border  im  border];

re_im = re_im(:, 1:width, :);
