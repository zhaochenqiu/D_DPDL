clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('./function/');
addpath('./old/');



fg_pa = '../detection/random_epoch/highway_60/';
fg_pa = '../detection/random_epoch/PETS2006_60/';
fg_ft = 'png';


gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';
gt_ft = 'png';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';
im_ft = 'jpg';














[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_fg fullfiles_fg] = loadFiles_plus(fg_pa, fg_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);


idx = 1550;
idx = 720;


im = double(imread(fullfiles_im{idx}));
gt = double(imread(fullfiles_gt{idx}));
fg = double(imread(fullfiles_fg{idx}));



% left = 160;
% top  = 300;
% right = 400;
% bottom = 560;
% 
% im = im(top:bottom, left:right, :);
% gt = gt(top:bottom, left:right, :);
% fg = fg(top:bottom, left:right, :);



% left = 160;
% top  = 1;
% right = 300;
% bottom = 80;
% 
% left = 160;
% top  = 300;
% right = 400;
% bottom = 560;
% 
% im = im(top:bottom, left:right, :);
% gt = gt(top:bottom, left:right, :);
% fg = fg(top:bottom, left:right, :);
% 


store_fm = [];

[TP FP FN TN] = evalution_entry(fg,gt);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]
store_fm = [store_fm; Re Pr Fm];





figure(1)
figure(2)



global g_displayMatrixImage
g_displayMatrixImage = 1;

%displayMatrixImage(1,1,3, im, fg, gt)
oldfg = fg;



for i = 1:200
    fg = bayesRefine(im, fg, 4, 0.8);
    
    [TP FP FN TN] = evalution_entry(fg,gt);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    [Re Pr Fm]
    store_fm = [store_fm; Re Pr Fm];

    sum(sum(fg == 255))

    showim = emphImage_byMask(im, fg, [120 101 200], 0.7);

%    figure(1)
    displayMatrixImage(i, 2, 3, im, oldfg, showim,  fg, gt, showim)

%    input('in the for')
%     input('in the for')

%     figure(2)
%     plot(1:i + 1, store_fm(:, 3), '-o', 'Color', [0.5 0.5 1], 'LineWidth', 4)
%     hold on
%     plot(1:i + 1, store_fm(:, 2), '-o', 'Color', [0.5 1 0.5], 'LineWidth', 4)
%     hold on
%     plot(1:i + 1, store_fm(:, 1), '-o', 'Color', [1 0.5 0.5], 'LineWidth', 4)
%     legend('Fm','Pr','Re', 'Location', 'southeast')
end


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


%features(:, :, 1:3) = im;


%L = L - min(min(L));
%A = A - min(min(A));
%B = B - min(min(B));


features(:, :, 1) = L;
features(:, :, 2) = A;

features(:, :, 3) = B;
features(:, :, 4:5) = impos;

% features(:, :, 4) = L;
% fearures(:, :, 5) = A;

% max(max(A))
% min(min(A))
% 
% max(max(B))
% max(max(B))
% 
% 
% 
% input('pause in the LAB')

[row_f column_f byte_f] = size(features);


ex_feats = padarray(features, [radius radius], 'symmetric');
ex_label = padarray(fgim, [radius radius], 'symmetric');
ex_image = padarray(im, [radius radius], 'symmetric');


% for i = 1:3
%     maxvalue = max(max(ex_feats(:, :, i)));
%     ex_feats(:, :, i) = (ex_feats(:, :, i) ./ maxvalue) * (max(size(features)));
% end

% 
% min(min(ex_feats(:, :, 1)))
% max(max(ex_feats(:, :, 1)))
% 
% min(min(ex_feats(:, :, 2)))
% max(max(ex_feats(:, :, 2)))
% 
% min(min(ex_feats(:, :, 3)))
% max(max(ex_feats(:, :, 3)))
% 
% min(min(ex_feats(:, :, 4)))
% max(max(ex_feats(:, :, 4)))
% 
% min(min(ex_feats(:, :, 5)))
% max(max(ex_feats(:, :, 5)))
% 
% 
% %impos(:, :, 2)
% 
% % ex_feats(1, :, 4)
% % ex_feats(:, 1, 5)
% 
% 
% input('pause in the')



% normalize each dimension of features
% for i = 1:byte_f
%     temp = ex_feats(:, :, i);
% 
%     maxvalue = max(max(temp));
%     temp = temp ./ maxvalue;
% 
%     ex_feats(:, :, i) = temp;
% end


% 
% % normalize the magnitude of each feature vector
% len_feats = ex_feats .* ex_feats;
% len_feats = sum(len_feats, 3);
% len_feats = len_feats .^ (0.5);
% 
% for i = 1:byte_f
%     temp = ex_feats(:, :, i);
% 
%     temp = temp ./ len_feats;
% 
%     ex_feats(:, :, i) = temp;
% end

% covert all 0 to 1
% idx = ex_feats == 0;
% ex_feats(idx) = 1;


num_feats = radius*2 + 1;
num_feats = num_feats^2;

store_label = ex_label;

for i = 1 + radius:row_f + radius
  for j = 1 + radius:column_f + radius
%for i = 36:40
%   for j = 37:50

% for i = 12:24
%  for j = 40:70
%for i = 146:160
%   for j = 107:120



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

%         for q = 1:byte_f
%             distance(:, q) = vec_im(:, q) - pixel(q);
%         end

        distance = vec_im - pixel;

%         distance = distance .* distance;
%         
%         clrdis = sqrt(sum(distance(:, 1:3), 2));
%         spadis = sqrt(sum(distance(:, 4:5), 2));
% 
%         [mean(clrdis(idx0)) mean(spadis(idx0))]
%         [mean(clrdis(idx1)) mean(spadis(idx1))]

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
%        dis_pos
%        mean_dis_pos

        clr_dis_pos = sqrt(sum(mean_dis_pos(1:3) .* mean_dis_pos(1:3)));
        spa_dis_pos = sqrt(sum(mean_dis_pos(4:5) .* mean_dis_pos(4:5)));


%         [clr_dis_neg spa_dis_neg]
%         [clr_dis_pos spa_dis_pos]
% 
%         [clr_dis_neg/mean_clr_dis spa_dis_neg/mean_spa_dis]
%         [clr_dis_pos/mean_clr_dis spa_dis_pos/mean_spa_dis]

        nor_clr_dis_neg = clr_dis_neg/mean_clr_dis;
        nor_spa_dis_neg = spa_dis_neg/mean_spa_dis;

        nor_clr_dis_pos = clr_dis_pos/mean_clr_dis;
        nor_spa_dis_pos = spa_dis_pos/mean_spa_dis;


%         nor_clr_dis_neg = clr_dis_neg;
%         nor_spa_dis_neg = spa_dis_neg;
% 
%         nor_clr_dis_pos = clr_dis_pos;
%         nor_spa_dis_pos = spa_dis_pos;


        dis_neg = sqrt(nor_clr_dis_neg^2 + nor_spa_dis_neg^2);
        dis_pos = sqrt(nor_clr_dis_pos^2 + nor_spa_dis_pos^2);

%        dis_neg = sqrt(nor_clr_dis_neg^2 );
%        dis_pos = sqrt(nor_clr_dis_pos^2 );



        if isnan(dis_neg) == 1
            dis_neg = 1000000;
        end

        if isnan(dis_pos) == 1
            dis_pos = 1000000;
        end


        P0 = sum(idx0)/(sum(idx0) + sum(idx1));
        P1 = sum(idx1)/(sum(idx0) + sum(idx1));

        
%         list = [P0 P1];
%         list = 1./(1 + exp(-(list - 0.5)));
%         P0 = list(1);
%         P1 = list(2);
    
%         P0 = atan(P0);
%         P1 = atan(P1);

%        P0 = 1/(1 + exp(3*(-P0 + 0.5)));
%        P1 = 1/(1 + exp(3*(-P1 + 0.5)));




        P0_X = P0 * (1/dis_neg);
        P1_X = P1 * (1/dis_pos);

        store_label(i,j) = (P1_X > rate*P0_X)*255;



%         [clr_dis_neg spa_dis_neg]
%         [clr_dis_pos spa_dis_pos]
% 
%         [nor_clr_dis_neg nor_spa_dis_neg]
%         [nor_clr_dis_pos nor_spa_dis_pos]
% 
%         [dis_neg dis_pos]
%         [1/dis_neg 1/dis_pos]
%         [P0 P1]
%         [P0_X P1_X]
% 
%         (P1_X > rate*P0_X)*255


%         mean_neg = mean(vec_neg, 1);
%         mean_pos = mean(vec_pos, 1);
% 
%         sigma_neg = mean( (vec_neg - mean(vec_neg)) .* (vec_neg - mean(vec_neg)), 1);
%         sigma_pos = mean( (vec_pos - mean(vec_pos)) .* (vec_pos - mean(vec_pos)), 1);
% 
%         
% %         pixel
% % 
% %         pixel
% %         mean_neg
% %         diag(sigma_neg)
% % 
% %         global g_pixel g_mean_neg g_sigma_neg
% %         g_pixel = pixel;
% %         g_mean_neg = mean_neg;
% %         g_sigma_neg = sigma_neg;
% % 
% %         sigma_pos
% 
%         tempidx = isnan(sigma_neg);
%         sigma_neg(tempidx) = 0.0001;
%         tempidx = isnan(sigma_pos);
%         sigma_pos(tempidx) = 0.0001;
% 
%         tempidx = isnan(mean_neg);
%         mean_neg(tempidx) = 100000;
%         tempidx = isnan(mean_pos);
%         mean_pos(tempidx) = 100000;
%         
%         tempidx = sigma_neg == 0;
%         sigma_neg(tempidx) = 0.0001;
%         tempidx = sigma_pos == 0;
%         sigma_pos(tempidx) = 0.0001;
% 
%         
% %        mean_neg
% %        mean_pos
% %        sigma_neg
% %        sigma_pos
% %        global g_sigma;
% %        g_sigma = sigma_pos;
% 
%         P_neg = mvnpdf(pixel, mean_neg, diag(sigma_neg));
%         P_pos = mvnpdf(pixel, mean_pos, diag(sigma_pos));
% 
% %         P_neg = 1;
% %         P_pos = 1;
% %         for q = 1:5
% %             P_neg = P_neg*gaussmf(pixel(q), [sigma_neg(q) mean_neg(q)]);
% %             P_pos = P_pos*gaussmf(pixel(q), [sigma_pos(q) mean_pos(q)]);
% %         end
% % 
%         
% 
% %        [P_neg P_pos]
% %        [P_neg*P0 P_pos*P1]
%         
%         store_label(i,j) = (P_pos*P1 > rate*P_neg*P0)*255;
% 





%         similars = vec_im ./ pixel;
% 
%         idx = similars > 1;
%         similars(idx) = 1 ./ similars(idx);
% 
%         similars = prod(similars, 2);

% 
%         PX_0 = mean(similars(idx0));
%         PX_1 = mean(similars(idx1));
% 
%         if isnan(PX_0) == 1
%             PX_0 = 0;
%         end
% 
%         if isnan(PX_1) == 1
%             PX_1 = 0;
%         end
% 
%         P0 = sum(idx0)/(sum(idx0) + sum(idx1));
%         P1 = sumuse')
% (idx1)/(sum(idx0) + sum(idx1));
% 
%         P0_X = PX_0 * P0;
%         P1_X = PX_1 * P1;
%         
% %        P0_X = PX_0;
% %        P1_X = PX_1;
% 

%         if isnan(P0) == 1
%             P0 = 0;
%         end
% 
%         if isnan(P1) == 1
%             P1 = 0;
%         end
% 

%         store_label(i,j) = (P1_X > rate*P0_X)*255;

        % left top right bottom
%        showim = drawRect(im,   [j - radius + 2 j + radius - 2 i - radius + 2 i + radius - 2]);
%        showfg = drawRect(ex_label, [j - radius + 2 j + radius - 2 i - radius + 2 i + radius - 2]);
        




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
% 
% %         PX_0
% %         PX_1
% %         P0
% %         P1
% %         P0_X
% %         P1_X
% %         (P1_X > rate*P0_X)*255
% %         pixel
%         input('pause')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        [i j]
% 
%         if PX_0 < 0
%             global g_similars
%             g_similars = similars
%             
%             global g_ex_feats
%             g_ex_feats = ex_feats
% 
%             ex_feats
% 
%             input('pause in the global')
%         end
% 
% %        input('pause')
% 
%         PX_0
%         PX_1
%         P0
%         P1
%         P0_X
%         P1_X
%         (P1_X > rate*P0_X)

%        input('pause')

    end
%    showSchedule(i, row_f + radius, 'bayesRefine');
end


store_label = store_label(1 + radius:row_f + radius, 1 + radius:column_f + radius );

re_fg = store_label;

end
