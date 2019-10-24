function re_fg = bayesRefine_3D(im_block, fg_block, radius, rate)

if nargin == 2
    radius = 4;
    rate = 0.6;
end

[row_im column_im byte_im frames_im] = size(im_block);
deep = frames_im;


% convert the image to position
pos_3D = img2pos_3D(im_block);


% convert the RGB to LAB
fts_3D = zeros(row_im, column_im, 6, frames_im);

for i = 1:frames_im
    im = im_block(:, :, :, i);
    [L A B] = rgb2lab(im(:, :, 1), im(:, :, 2), im(:, :, 3));

    fts_3D(:, :, 1, i) = L;
    fts_3D(:, :, 2, i) = A;
    fts_3D(:, :, 3, i) = B;
    fts_3D(:, :, 4:6, i) = pos_3D(:, :, :, i);
end


ex_feats_3D = padarray(fts_3D,     [radius radius], 'symmetric');
ex_label_3D = padarray(fg_block, [radius radius], 'symmetric');

num_feats = radius*2 + 1;
num_feats = num_feats * num_feats * deep;



[row_fts column_fts byte_fts frames_fts] = size(ex_feats_3D);

store_label = zeros(row_fts, column_fts);


for r = 1 + radius:row_im + radius
    for c = 1 + radius:column_im + radius
        % extract the vector of center pixels
        pixel = ex_feats_3D(r, c, :, 1);
        pixel = squeeze(pixel)';

        entim = ex_feats_3D(r - radius:r + radius, c - radius:c + radius, :, :);
        entim = permute(entim, [1 2 4 3]);

        entfg = ex_label_3D(r - radius:r + radius, c - radius:c + radius, :, :);
        entfg = permute(entfg, [1 2 4 3]);

        vec_im = reshape(entim, num_feats, 6);
        vec_lb = reshape(entfg, num_feats, 1);


        idx0 = vec_lb == 0;
        idx1 = vec_lb == 255;


        P0 = sum(idx0)/(sum(idx0) + sum(idx1));
        P1 = sum(idx1)/(sum(idx0) + sum(idx1));


        if P0 == 1 | P1 == 1
            store_label(r, c) = (P1 > rate*P0)*255;
        else
            distance = vec_im - pixel;

            % find the max color distance
            clrlist = distance(:, 1:3) .* distance(:, 1:3);
            clrlist = sqrt(sum(clrlist, 2));
            mean_clr_dis = mean(clrlist);

            spalist = distance(:, 4:6) .* distance(:, 4:6);
            spalist = sqrt(sum(spalist, 2));
            mean_spa_dis = mean(spalist);


            % negative samples
            vec_neg = vec_im(idx0, :);
            dis_neg = distance(idx0, :);
            mean_dis_neg = mean(dis_neg, 1);

            clr_dis_neg = sqrt(sum(mean_dis_neg(1:3) .* mean_dis_neg(1:3)));
            spa_dis_neg = sqrt(sum(mean_dis_neg(4:6) .* mean_dis_neg(4:6)));


            % positive samples
            vec_pos = vec_im(idx1, :);
            dis_pos = distance(idx1, :);
            mean_dis_pos = mean(dis_pos, 1);

            clr_dis_pos = sqrt(sum(mean_dis_pos(1:3) .* mean_dis_pos(1:3)));
            spa_dis_pos = sqrt(sum(mean_dis_pos(4:6) .* mean_dis_pos(4:6)));


            mean_neg = mean(vec_neg, 1);
            mean_pos = mean(vec_pos, 1);

            sigma_neg = mean( (vec_neg - mean(vec_neg)) .* (vec_neg - mean(vec_neg)), 1);
            sigma_pos = mean( (vec_pos - mean(vec_pos)) .* (vec_pos - mean(vec_pos)), 1);

            sigma_dis_neg = sqrt(sigma_neg(4) + sigma_neg(5) + sigma_neg(6));
            sigma_dis_pos = sqrt(sigma_pos(4) + sigma_pos(5) + sigma_pos(6));

%            sigma_clr_dis_neg = sqrt(sigma_neg(1) + sigma_neg(2) + sigma_neg(3));
%            sigma_clr_dis_pos = sqrt(sigma_pos(1) + sigma_pos(2) + sigma_pos(3));

            if isnan(sigma_dis_neg) == 1
                sigma_dis_neg = 100000000;
            end

            if isnan(sigma_dis_pos) == 1
                sigma_dis_neg = 100000000;
            end

            % 这个地方是clr distance 和 spa distance之间对比，所以除以整体的均值是可以的
            nor_clr_dis_neg = clr_dis_neg/mean_clr_dis;
            nor_spa_dis_neg = spa_dis_neg/mean_spa_dis;

            nor_clr_dis_pos = clr_dis_pos/mean_clr_dis;
            nor_spa_dis_pos = spa_dis_pos/mean_spa_dis;

            nor_spa_dis_pos = nor_spa_dis_pos * (sigma_dis_pos/sigma_dis_neg);
%            nor_clr_dis_pos = nor_clr_dis_pos * (sigma_clr_dis_pos/sigma_clr_dis_neg);



            dis_neg = sqrt(nor_clr_dis_neg^2 + nor_spa_dis_neg^2);
            dis_pos = sqrt(nor_clr_dis_pos^2 + nor_spa_dis_pos^2);


            if isnan(dis_neg) == 1
                dis_neg = 1000000;
            end

            if isnan(dis_pos) == 1
                dis_pos = 1000000;
            end


            if dis_neg == 0 | dis_pos == 0 | sigma_dis_pos == 0 | sigma_dis_neg == 0
                dis_neg = 1;
                dis_pos = 1;
            end

            P0_X = P0 * ((1/dis_neg));
            P1_X = P1 * ((1/dis_pos));


            store_label(r,c) = (P1_X > rate*P0_X)*255;

        end
    end
end


store_label = store_label(1 + radius:row_im + radius, 1 + radius:column_im + radius );

re_fg = store_label;
