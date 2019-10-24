function [] = func_detect(im_pa, gt_pa, net_path, path_save)

im_ft = 'jpg';

gt_ft = 'png';

[idx gt]= pickFrame(gt_pa, gt_ft);


net_name = [net_path 'net-epoch-100.mat'];

radius = 9;
idx_num = idx;

% imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx_num, radius^2, 'train', 'set');
% imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');
% 
% 
% bgs_train_random(imdb, net_path);



% test the performance
imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx_num, radius^2, 'test', 'set');

net = load(net_name);
net = net.net;



[files fullfiles] = loadFiles_plus(im_pa, im_ft);

frames = max(size(files));

[row_im column_im byte_im] = size(double(imread(fullfiles{1})));


store_entry = [];
storage_fm = [];


for i = 1:frames
    if i < 100
		fgim = zeros(row_im, column_im);
%		displayMatrixImage(i,1,2,fgim,fgim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, path_save, str);
    else
		imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, i, 81);

		[fgim gtim] = getFgImg(net, imdb);


		[TP FP FN TN] = evalution_entry(fgim,gtim);

		Re = TP/(TP + FN);
		Pr = TP / (TP + FP);
		Fm = (2*Pr*Re)/(Pr + Re);
		Fm

		storage_fm = [storage_fm; Re Pr Fm];
        store_entry = [store_entry; TP FP FN TN];

%		displayMatrixImage(i,1,2,fgim,gtim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, path_save, str);
    end
end



list = sum(store_entry, 1);
TP = list(1);
FP = list(2);
FN = list(3);
TN = list(4);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);


value = [Re Pr Fm];
value = [value; mean(storage_fm)];

txtWrite(value, [path_save 'result.txt']);
