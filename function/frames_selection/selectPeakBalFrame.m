function [idx re_value] = selectPeakBalFrame(im_pa, im_ft, rate)

if nargin == 2
    rate = 0.2;
end

idxs_peak = getFgPeakFrames(im_pa, im_ft, 10000, 2);

[fs_im fullfs_im] = loadFiles_plus(im_pa, im_ft);


len = max(size(idxs_peak));

distance = 100;
idx = -1;
re_value = 0;

for i = 1:len
    fg = double(imread(fullfs_im{idxs_peak(i)}));

    idx0 = fg == 0;
    idx1 = fg == 255;

    sumvalue = sum(sum(idx0)) + sum(sum(idx1));
    value = sum(sum(idx1))/( sum(sum(idx0)) + sum(sum(idx1)) );

    if abs(value - rate) < distance
        distance = abs(value - rate);
        idx = idxs_peak(i);
        re_value = value;
    end
end



% idxs_peak
% 
% input('pause')
% 
% 
% 
% 
% frames = max(size(fullfs_im));
% 
% distance = 100;
% idx = -1;
% re_value = 0;
% 
% for i = 1:frames
%     fg = double(imread(fullfs_im{i}));
% 
%     idx0 = fg == 0;
%     idx1 = fg == 255;
% 
%     sumvalue = sum(sum(idx0)) + sum(sum(idx1));
%     value = sum(sum(idx1))/( sum(sum(idx0)) + sum(sum(idx1)) );
% 
%     if abs(value - rate) < distance
%         distance = abs(value - rate);
%         idx = i;
%         re_value = value;
%     end
% end
