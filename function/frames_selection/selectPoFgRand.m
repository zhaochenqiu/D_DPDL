function [re_idxes re_rates] = selectPoFgRand(fg_pa, fg_ft, num)


if nargin == 2
    num = 2;
end


[fs_im fullfs_im] = loadFiles_plus(fg_pa, fg_ft);

im = double(imread(fullfs_im{1}));
[row_im column_im byte_im] = size(im);



frames = max(size(fullfs_im));

mat = zeros(frames, 2);

for i = 1:frames
    fgim = double(imread(fullfs_im{i}));
    
    idx_fg = fgim == 255;
    idx_bk = fgim == 0;

    fgval = sum(sum(idx_fg));
    bkval = sum(sum(idx_bk));

    mat(i, 1) = fgval;
    mat(i, 2) = bkval;
end

list = mat(:, 1);


pos_record = [];

for i = 2:size(list)
    if xor(list(i - 1) == 0, list(i) == 0)
        pos_record = [pos_record; i];
    end
end

len = numel(pos_record);

if mod(len, 2) ~= 0
    pos_record = [pos_record; frames];
end

vallist = abs(list - list) + 1;

for i = 1:2:numel(pos_record)
    left = pos_record(i);
    right = pos_record(i +  1);

    data = list(left:right);
    val = mean(data);

    vallist(left:right) = val;
end

x = 1:frames;
y = list;

list_fg = [];
list_bk = [];

% figure
for i = 1:frames
    if y(i) > vallist(i)
        list_fg = [list_fg i];
%        plot(x(i), y(i), '.:', 'Color', [0 0 1])
    else
        list_bk = [list_bk i];
%        plot(x(i), y(i), '.:', 'Color', [1 0 0])
    end
%    hold on
%    drawnow
end


list_fg = list_fg(randperm(numel(list_fg)));
list_fg = list_fg(randperm(numel(list_fg)));
list_fg = list_fg(randperm(numel(list_fg)));




re_idxes = list_fg(1:num);
re_idxes = re_idxes';
re_rates = list(re_idxes);
re_rates = re_rates ./ (row_im * column_im);



% re_idxes = list_fg;
% re_rates = list(list_fg);




%figure
%plot(list_fg, list(list_fg), '.b')
%hold on
%plot(list_bk, list(list_bk), '.r')


