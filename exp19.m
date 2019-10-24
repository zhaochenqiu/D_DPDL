clear all
close all
clc


addpath('~/projects/matrix/common/')
addpath('~/projects/matrix/common_c/');


pa_im = '~/dataset/dataset2014/dataset/baseline/highway/input/';
ft_im = 'jpg';

pa_gt = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
ft_gt = 'png';

pa_sg = '~/projects/matrix/result/';
ft_sg = 'png';


[files_im fullpa_im] = loadFiles_plus(pa_im, ft_im);
[files_gt fullpa_gt] = loadFiles_plus(pa_gt, ft_gt);
[files_sg fullpa_sg] = loadFiles_plus(pa_sg, ft_sg);


index = 1481;

im = double(imread(fullpa_im{index}));
gt = double(imread(fullpa_gt{index}));
sg = double(imread(fullpa_sg{index}));


% global g_displayMatrixImage
% 
% g_displayMatrixImage = 1;
% figure
% displayMatrixImage(1,1,3,im,gt,sg)
% 

impos = img2pos(im);


[row column byte] = size(im);
features = zeros(row, column, 5);
features(:, :, 1:3) = im;
features(:, :, 4:5) = impos;

% matrix to vec
[row_f column_f byte_f] = size(features);


radius = 4;
ex_feats = padarray(features, [radius radius], 'symmetric');
ex_label = padarray(sg, [radius radius], 'symmetric');



% 调整x，y坐标
% ex_feats(:, :, 4) = ex_feats(:, :, 4)*20;
% ex_feats(:, :, 5) = ex_feats(:, :, 5)*20;





% normalize the features
for i = 1:byte_f
    temp = ex_feats(:, :, i);

    maxvalue = max(max(temp));
    temp = temp/maxvalue;

    ex_feats(:, :, i) = temp;
end

% normalize the entry of features
% 模长强制为1
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
%        idx1 = vec_lb == 1;
        idx1 = vec_lb == 255;

        % extract the distance
        similars = vec_im .* pixel;
        similars = sum(similars, 2);

        % 计算后验概率
        PB = mean(similars);

        % capture the possibility of the pixel belong to background
        PA_0 = sum(sum(idx0))/(sum(sum(idx0)) + sum(sum(idx1)));
        PA_1 = sum(sum(idx1))/(sum(sum(idx0)) + sum(sum(idx1)));


        % extract the possibility of the pixel belong to 0
        PA_0 = sum(idx0) / (sum(idx0) + sum(idx1));

        vec_im_0 = vec_im(idx0, :);
        similars_0 = vec_im_0 .* pixel;
        similars_0 = sum(similars_0, 2);
        
        PB_0 = mean(similars_0);

        P0_B = (PB_0 * PA_0)/PB;

        % extract the possibility of the pixel belong to 1
        PA_1 = sum(idx1) / (sum(idx0) + sum(idx1));

        vec_im_1 = vec_im(idx1, :);
        similars_1 = vec_im_1 .* pixel;
        similars_1 = sum(similars_1, 2);

        PB_1 = mean(similars_1);

        P1_B = (PB_1 * PA_1)/PB;


        if isnan(P0_B) == 1
            P0_B = 0;
        end

        if isnan(P1_B) == 1
            P1_B = 0;
        end

        store_label(i,j) = (P1_B > 0.6*P0_B)*255;
    end
    i
end



store_label = store_label(1 + radius:row_f + radius, 1 + radius:column_f + radius );

[TP FP FN TN] = evalution_entry(store_label,gt);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]




[TP FP FN TN] = evalution_entry(sg,gt);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]


figure
displayMatrixImage(1, 2, 2, im, gt, sg, store_label);

F = getframe(gcf)'
imwrite(F.cdata, 'refine.png')
