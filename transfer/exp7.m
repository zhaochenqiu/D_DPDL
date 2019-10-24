clear all
close all
clc


addpath('D:\projects\matrix\common');
addpath('D:\projects\matrix\common_c');



% iml_pa = 'D:\dataset\dataset2014\dataset\shadow\busStation\input';
% im_ft = 'jpg';
% 
% gtl_pa = 'D:\dataset\dataset2014\dataset\shadow\busStation\groundtruth';
% gt_ft = 'png';
% 
% 
% imr_pa = 'D:\dataset\dataset2014\dataset\baseline\pedestrians\input';
% im_ft = 'jpg';
% 
% gtr_pa = 'D:\dataset\dataset2014\dataset\baseline\pedestrians\groundtruth';
% gt_ft = 'png';


iml_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\overpass\input';
im_ft = 'jpg';

gtl_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\overpass\groundtruth';
gt_ft = 'png';


imr_pa = 'D:\dataset\dataset2014\dataset\baseline\highway\input';
im_ft = 'jpg';

gtr_pa = 'D:\dataset\dataset2014\dataset\baseline\highway\groundtruth';
gt_ft = 'png';



[fs_im fullfs_im] = loadFiles_plus(iml_pa, im_ft);
[fs_gt fullfs_gt] = loadFiles_plus(gtl_pa, gt_ft);


frames = max(size(fullfs_im));

rhl = [];
ghl = [];
bhl = [];

for i = 1:frames
    im = double(imread(fullfs_im{i}));
    gt = double(imread(fullfs_gt{i}));

    rim = im(:, :, 1);
    gim = im(:, :, 2);
    bim = im(:, :, 3);

    idx = gt == 255;
    value = sum(sum(idx));
    
    if value > 10

        rhl = [rhl; rim(idx)];
        ghl = [ghl; gim(idx)];
        bhl = [bhl; bim(idx)];
    end
end





[fs_im fullfs_im] = loadFiles_plus(imr_pa, im_ft);
[fs_gt fullfs_gt] = loadFiles_plus(gtr_pa, gt_ft);


frames = max(size(fullfs_im));

rhr = [];
ghr = [];
bhr = [];

for i = 1:frames
    im = double(imread(fullfs_im{i}));
    gt = double(imread(fullfs_gt{i}));

    rim = im(:, :, 1);
    gim = im(:, :, 2);
    bim = im(:, :, 3);

    idx = gt == 255;
    value = sum(sum(idx));
    
    if value > 10

        rhr = [rhr; rim(idx)];
        ghr = [ghr; gim(idx)];
        bhr = [bhr; bim(idx)];
    end
end


hl = [hist(rhl, 1:255) hist(ghl, 1:255) hist(bhl, 1:255)];
hr = [hist(rhr, 1:255) hist(ghr, 1:255) hist(bhr, 1:255)];


figure
subplot(2,1,1)
bar(hl)
subplot(2,1,2)
bar(hr)







% iml_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
iml_pa = 'D:\dataset\dataset2014\dataset\dynamicBackground\overpass\input';
im_ft = 'jpg';


% imr_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
imr_pa = 'D:\dataset\dataset2014\dataset\baseline\highway\input';
im_ft = 'jpg';



[fs fullfs] = loadFiles_plus(iml_pa, im_ft);

iml = double(imread(fullfs{1}));
% iml = rgb2lab(iml);


hl = getRGBHist(iml);


[fs fullfs] = loadFiles_plus(imr_pa, im_ft);

imr = double(imread(fullfs{1}));
% imr = rgb2lab(imr);

hr = getRGBHist(imr);

figure
subplot(2,1,1)
bar(hl)

subplot(2,1,2)
bar(hr)



