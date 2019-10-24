function re_fg = bayesRefine(im, fgim, radius, rate)

if nargin == 2
    radius = 4;
    rate = 0.6;
end

if nargin == 3
    rate = 0.6;
end

impos = img2pos(im);

[L A B] = rgb2lab(im(:, :, 1), im(:, :, 2), im(:, :, 3));


[row column byte] = size(im);

features = zeros(row, column, 5);


features(:, :, 1) = L;
features(:, :, 2) = A;

features(:, :, 3) = B;
features(:, :, 4:5) = impos;


[row_f column_f byte_f] = size(features);


ex_feats = padarray(features, [radius radius], 'symmetric');
ex_label = padarray(fgim, [radius radius], 'symmetric');
ex_image = padarray(im, [radius radius], 'symmetric');


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


        midpos = round(num_feats/2);
        vec_im = vec_im([1:midpos - 1, midpos + 1:end], :);
        vec_lb = vec_lb([1:midpos - 1, midpos + 1:end], 1);


        idx0 = vec_lb == 0;
        idx1 = vec_lb == 255;

        P0 = sum(idx0)/(sum(idx0) + sum(idx1));
        P1 = sum(idx1)/(sum(idx0) + sum(idx1));


        if P0 == 1 | P1 == 1
            store_label(i,j) = (P1 > rate*P0)*255;
        else

            distance = vec_im - pixel;


            % find the max color distance
            
            clrlist = distance(:, 1:3) .* distance(:, 1:3);
            clrlist = sqrt(sum(clrlist, 2));
            mean_clr_dis = mean(clrlist);

            spalist = distance(:, 4:5) .* distance(:, 4:5);
            spalist = sqrt(sum(spalist, 2));
            mean_spa_dis = mean(spalist);


            % negative samples
            vec_neg = vec_im(idx0, :);
            dis_neg = distance(idx0, :);
            mean_dis_neg = mean(dis_neg, 1);

            clr_dis_neg = sqrt(sum(mean_dis_neg(1:3) .* mean_dis_neg(1:3)));
            spa_dis_neg = sqrt(sum(mean_dis_neg(4:5) .* mean_dis_neg(4:5)));


            % positive samples
            vec_pos = vec_im(idx1, :);
            dis_pos = distance(idx1, :);
            mean_dis_pos = mean(dis_pos, 1);

            clr_dis_pos = sqrt(sum(mean_dis_pos(1:3) .* mean_dis_pos(1:3)));
            spa_dis_pos = sqrt(sum(mean_dis_pos(4:5) .* mean_dis_pos(4:5)));


            mean_neg = mean(vec_neg, 1);
            mean_pos = mean(vec_pos, 1);

            sigma_neg = mean( (vec_neg - mean(vec_neg)) .* (vec_neg - mean(vec_neg)), 1);
            sigma_pos = mean( (vec_pos - mean(vec_pos)) .* (vec_pos - mean(vec_pos)), 1);

            sigma_dis_neg = sqrt(sigma_neg(4) + sigma_neg(5));
            sigma_dis_pos = sqrt(sigma_pos(4) + sigma_pos(5));

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


            store_label(i,j) = (P1_X > rate*P0_X)*255;
        end





% print the temporary result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%         showim = drawRect_plus(ex_image, [j - radius i - radius j + radius i + radius], 2, [255 100 100]);
%         showfg = drawRect_plus(ex_label, [j - radius i - radius j + radius i + radius], 2, [255 100 100]);
%         showre = drawRect_plus(store_label, [j - radius i - radius j + radius i + radius], 2, [255 100 100]);
%         
% 
%         rectim = ex_image(i - radius:i + radius, j - radius:j + radius, :);
%         currim = ex_image(i, j, :);
% 
%         temp = ex_image;
%         temp(i, j, 1) = 255;
%         temp(i, j ,2) = 0;
%         temp(i, j ,3) = 0;
%         currpt = temp(i - radius:i + radius, j - radius:j + radius, :);
%         emphmk = ex_label(i - radius:i + radius, j - radius:j + radius, :);
%         currpt_em = emphImage_byMask(currpt, emphmk, [140 101 100], 0.7);
% 
%         
%         
%         [row_t column_t byte_t] = size(emphmk);
%         clremphmk = zeros(row_t, column_t, 3);
% 
%         clremphmk(:, :, 1) = emphmk;
%         clremphmk(:, :, 2) = emphmk;
%         clremphmk(:, :, 3) = emphmk;
%         
%         clremphmk(radius + 1, radius + 1, 1) = 255;
%         clremphmk(radius + 1, radius + 1, 2) = 0;
%         clremphmk(radius + 1, radius + 1, 3) = 0;
% 
%         showim(i, j, 1) = 255;
%         showim(i, j, 2) = 0;
%         showim(i, j, 3) = 0;
% 
%         displayMatrixImage(i, 3, 3, showim, showfg, showre, rectim, currim,currpt, currpt_em, clremphmk, emphmk)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
%    showSchedule(i, row_f + radius, 'bayesRefine');
end


store_label = store_label(1 + radius:row_f + radius, 1 + radius:column_f + radius );

re_fg = store_label;

end
