function re_fg = bayesRefine(im, fgim, radius, rate)

if nargin == 2
    radius = 4;
    rate = 0.6;
end

if nargin == 3
    rate = 0.6;
end



impos = img2pos(im);


[row column byte] = size(im);

features = zeros(row, column, 5);

features(:, :, 1:3) = im;
features(:, :, 4:5) = impos;


[row_f column_f byte_f] = size(features);


ex_feats = padarray(features, [radius radius], 'symmetric');
ex_label = padarray(fgim, [radius radius], 'symmetric');


% normalize each of dimension of features
for i = 1:byte_f
    temp = ex_feats(:, :, i);

    maxvalue = max(max(temp));
    temp = temp ./ maxvalue;

    ex_feats(:, :, i) = temp;
end

% normalize the magnitude of each feature vector
len_feats = ex_feats .* ex_feats;
len_feats = sum(len_feats, 3);
len_feats = len_feats .^ (0.5);

for i = 1:byte_f
    temp = ex_feats(:, :, i);

    temp = temp ./ len_feats;

    ex_feats(:, :, i) = temp;
end


num_feats = radius*2 + 1;
num_feats = num_feats^2;

store_label = ex_label;

for i = 1 + radius:row_f + radius
    for j = 1 + radius:column_f + radius
        entim = ex_feats(i - radius:i + radius, j - radius:j + radius, :);
        pixel = ex_feats(i, j, :);
        pixel = squeeze(pixel)';

        label = ex_label(i - radius:i + radius, j - radius:j + radius, :);

        vec_im = reshape(entim, num_feats, byte_f);
        vec_lb = reshape(label, num_feats, 1);


        idx0 = vec_lb == 0;
        idx1 = vec_lb == 255;

        similars = vec_im .* pixel;
        similars = sum(similars, 2);

%        P0 = sum(similars(idx0));
%        P1 = sum(similars(idx1));


        P0 = mean(similars(idx0));
        P1 = mean(similars(idx1));

        P0 = P0 * sum(idx0)/(sum(idx0) + sum(idx1));
        P1 = P1 * sum(idx1)/(sum(idx0) + sum(idx1));

        if isnan(P0) == 1
            P0 = 0;
        end

        if isnan(P1) == 1
            P1 = 0;
        end

        store_label(i,j) = (P1 > rate*P0)*255;
    end
%    showSchedule(i, row_f + radius, 'bayesRefine');
end


store_label = store_label(1 + radius:row_f + radius, 1 + radius:column_f + radius );

re_fg = store_label;
