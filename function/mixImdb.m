function re_imdb = mixImdb(varargin )

num = 0;

imgsize_set = {};
index_set = {};


imdb_sizes = [];


for i = 1:nargin
    imdb = varargin{i};

%    imgsize_set = {imgsize_set{:}, imdb.images.imgsize};
%    index_set = {index_set{:}, imdb.images.index};
    
%    imdb.images.labels
    value = max(size(imdb.images.labels));

    num = num + value;
    imdb_sizes = [imdb_sizes; value];
end

[row_im column_im byte_im frames_im] = size(imdb.images.data);

disp('mixImdb: apply memory');
re_imdb.images.data = zeros(row_im,column_im,byte_im,num,'int16');
re_imdb.images.labels = zeros(1,num,'single');
disp('mixImdb: apply memory success');

index = single(randperm(num));


count = 1;


tic
% imdb_len = max(size(imdb.images.data));

disp('random data')

for i = 1:max(size(index))
    pos = index(i);

%     base = round(pos/imdb_len - 0.5) + 1;
%     offset = pos - (base - 1)*imdb_len;
% 
%     imdb = varargin{base};
% 
%     size(imdb.images.data)
%     imdb_len
%     pos
%     base
%     offset

    [base offset] = getIndexInMix(pos, imdb_sizes);
    imdb = varargin{base};


    re_imdb.images.data(:, :, :, i) = imdb.images.data(:, :, :, offset);
    re_imdb.images.labels(i) = imdb.images.labels(offset);
end
time = toc
time

disp('random data complete')

% global g_re_imdb1
% g_re_imdb1 = re_imdb;




% disp('mixImdb: apply memory');
% re_imdb.images.data = zeros(row_im,column_im,byte_im,num,'int16');
% re_imdb.images.labels = zeros(1,num,'single');
% disp('mixImdb: apply memory success');





% 
% disp('mixImdb: copy data');
% for i = 1:nargin
%     imdb = varargin{i};
% 
%     value = max(size(imdb.images.labels));
% 
%     left = count;
%     right = count + value - 1;
% 
%     re_imdb.images.data(:,:,:,left:right) = int16(imdb.images.data);
%     re_imdb.images.labels(left:right) = imdb.images.labels;
% 
% 
%     count = count + value;
% 
%     imdb = [];
%     clear imdb;
%     varargin{i} = [];
% %    pack
% 
% end
% clear varargin;
% % pack
% 
% 
% disp('mixImdb: copy data success');
% 
% 
% 
% % input('pause here')
% %re_imdb.images.data = data(:,:,:,index);
% %re_imdb.images.labels = labels(index);
% 
% % re_imdb.images.data = data;
% % clear data;
% % re_imdb.images.labels = labels;
% % clear labels;
% 
% %re_imdb.images.index_set = index_set;
% %re_imdb.images.imgsize_set = imgsize_set;
% 
% disp('random data')
% 
% 
% 
% % index_mark = zeros( max(size(re_imdb.images.labels)),1, 'int8');
% 
% % tic
% % for i = 1:max(size(index_mark))
% %     if index_mark(i) == 0
% %         posl = i;
% %         posr = index(i);
% % 
% %         index_mark(posl) = 1;
% %         index_mark(posr) = 1;
% % 
% %         tempdata = re_imdb.images.data(:, :, :, posl);
% %         templabs = re_imdb.images.labels(posl);
% % 
% %         re_imdb.images.data(:, :, :, posl) = re_imdb.images.data(:, :, :, posr);
% %         re_imdb.images.labels(posl) = re_imdb.images.labels(posr);
% % 
% %         re_imdb.images.data(:, :, :, posr) = tempdata;
% %         re_imdb.imsges.labels(posr) = templabs;
% % 
% %     end
% % end
% % time = toc
% % time
% 
% 
% re_imdb.images.data = re_imdb.images.data(:, :, :, index);
% re_imdb.images.labels = re_imdb.images.labels(index);
% 
% global g_re_imdb2
% g_re_imdb2 = re_imdb;
% 
% input('stop here')

% re_imdb.images.data = single(re_imdb.images.data);
disp('random data success')

re_imdb.images.index = index;

re_imdb.images.set      = zeros(1,num,'single') + 1;
re_imdb.images.data_mean = mean(re_imdb.images.data,4);

re_imdb.meta.sets       = {'train' 'Val' 'test'};
re_imdb.meta.classes    = {'0' '1'};

