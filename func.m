function [] = iterativelyTrain()


im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
gt_ft = 'png';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% start the network
idx = selectBalFrame(gt_pa, gt_ft);
src_idx = idx;

net_path = '../network/iteration_01/baseline/office/';
net_name = [net_path 'net-epoch-60.mat'];


radius = 9;


imdb = getMultiRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'train', 'set');
imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'get');

bgs_train_multi_random(imdb, net_path);


imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'test', 'set');

net = load(net_name);
net = net.net;

store_temp = [];

for i = 1:10
    imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');


    [fgim gtim] = getFgImg(net, imdb);


    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    temp = [Re Pr Fm]
    store_temp = [store_temp; temp];
end

store_temp


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% detect the foreground
% net_name is there
% the network is there
fgsv_pa = '../detection/iteration_01/baseline/office/net2fg/';



[files fullfiles] = loadFiles_plus(im_pa, im_ft);

frames = max(size(files));

[row_im column_im byte_im] = size(double(imread(fullfiles{1})));


storage_fm = [];
store_entry = [];


for i = 1:frames

	if i < 300
		fgim = zeros(row_im, column_im) + 85;
		displayMatrixImage(i,1,2,fgim,fgim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, fgsv_pa, str);
	else

		imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, i, 81);

		[fgim gtim] = getFgImg(net, imdb);


		[TP FP FN TN] = evalution_entry(fgim,gtim);

        store_entry = [store_entry; TP FP FN TN];


		Re = TP/(TP + FN);
		Pr = TP / (TP + FP);
		Fm = (2*Pr*Re)/(Pr + Re);
		Fm

		storage_fm = [storage_fm; Re Pr Fm];

		displayMatrixImage(i,1,2,fgim,gtim)

		str = sprintf('re%06d',i);
		str = [str '.png'];
		saveImage(fgim, fgsv_pa, str);
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

value = [Re Pr Fm]

txtWrite(value, 'temp.txt');





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% refine the model by Bayesian Theorem

basv_pa = '../detection/iteration_01/baseline/office/fg2bayes/';




[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_fg fullfiles_fg] = loadFiles_plus(fg_pa, fg_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);


frames = max(size(fullfiles_gt));

store_entry = [];
store_fm = [];

store_all = [];



num_bay = 3;

figure

global g_displayMatrixImage
g_displayMatrixImage = 1;


for i = 1:frames
    if i < 300
        fgim = double(imread(fullfiles_gt{1}));
        saveImage(fgim, basv_pa, files_fg{i});
    else
        im   = double(imread(fullfiles_im{i}));
        fgim = double(imread(fullfiles_fg{i}));
        gtim = double(imread(fullfiles_gt{i}));

        oldfg = fgim;

        store_temp = [];

        [TP FP FN TN] = evalution_entry(fgim,gtim);

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        store_temp = [store_temp; Re Pr Fm]


        for j = 1:num_bay
            fgim = bayesRefine(im, fgim, 3, 0.8);

            [TP FP FN TN] = evalution_entry(fgim,gtim);

            Re = TP/(TP + FN);
            Pr = TP / (TP + FP);
            Fm = (2*Pr*Re)/(Pr + Re);

            store_temp = [store_temp; Re Pr Fm]

            plot(1:j + 1, store_temp(:, 3), '-o', 'Color', [0.5 0.5 1], 'LineWidth', 4)
            hold on
            plot(1:j + 1, store_temp(:, 2), '-o', 'Color', [0.5 1 0.5], 'LineWidth', 4)
            hold on
            plot(1:j + 1, store_temp(:, 1), '-o', 'Color', [1 0.5 0.5], 'LineWidth', 4)
            legend('Fm','Pr','Re', 'Location', 'southeast')
            drawnow
        end



        [TP FP FN TN] = evalution_entry(fgim,gtim);

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        store_entry = [store_entry; TP FP FN TN];
        store_fm = [store_fm; Re Pr Fm];

        showim = emphImage_byMask(im, fgim, [200 101 100], 0.7);

        saveImage(fgim, basv_pa, files_fg{i});


        displayMatrixImage(i, 2, 3, im, gtim, showim, oldfg, fgim, im);
        i
    end
end


% [TP FP FN TN] = sum(store_entry, 1);
list = sum(store_entry, 1);
TP = list(1);
FP = list(2);
FN = list(3);
TN = list(4);


Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

value = [Re Pr Fm]

txtWrite(value, 'temp.txt');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% re-train the network



