function [] = testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa)


net = load(net_pa);
net = net.net;

radius = 25;
num_bay = 3;
bay_range = 4;
bay_rate = 0.7;

[files fullfiles] = loadFiles_plus(im_pa, im_ft);

frames = max(size(files));

[row_im column_im byte_im] = size(double(imread(fullfiles{1})));

store_entry = [];
fg_pa_net2fg = [fg_pa sprintf('iteration_%02d_net2fg/', 1)];


ROI_list = getTempROI(gt_pa, gt_ft);


pa_name = extractPathName_byResult(fg_pa);
pa_name



%%%%%%%%%%%%%%%%%%%%%%%
if exist(fg_pa_net2fg) ~= 0
    [files_cur fullfiles_cur] = loadFiles_plus(fg_pa_net2fg, gt_ft);

    curmaxnum = max(size(files_cur));

    [files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);

    disp('the fg_pa_net2fg is there')
else
    curmaxnum = 0;
end
%%%%%%%%%%%%%%%%%%%%%%%



for j = 1:frames
    j
%            if j < 300
    if ROI_list(j) < 10
        fgim = zeros(row_im, column_im) + 85;
        displayMatrixImage(j,1,2,fgim,fgim)

        str = sprintf('re%06d',j);
        str = [str '.png'];
        saveImage(fgim, fg_pa_net2fg, str);
    elseif j < curmaxnum
        fgim = double(imread(fullfiles_cur{j}));
        gtim = double(imread(fullfiles_gt{j}));



        [TP FP FN TN] = evalution_entry(fgim,gtim);
        store_entry = [store_entry; TP FP FN TN];

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re)


        list = sum(store_entry, 1);
        TP = list(1);
        FP = list(2);
        FN = list(3);
        TN = list(4);


        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        value = [Re Pr Fm]



        displayMatrixImage(j, 1, 2, fgim, gtim);

    else
        imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, j, radius^2);
        [fgim gtim] = getFgImg(net, imdb);

        [TP FP FN TN] = evalution_entry(fgim,gtim);
        store_entry = [store_entry; TP FP FN TN];

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re)



        list = sum(store_entry, 1);
        TP = list(1);
        FP = list(2);
        FN = list(3);
        TN = list(4);


        Re = TP/(TP + FN)
        Pr = TP / (TP + FP)
        Fm = (2*Pr*Re)/(Pr + Re)

        value = [Re Pr Fm]


        displayMatrixImage(j, 1, 2, fgim, gtim);

        str = sprintf('re%06d',j);
        str = [str '.png'];
        saveImage(fgim, fg_pa_net2fg, str);
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

txtWrite(value, sprintf('%s_iteration_%02d_fg.txt',pa_name ,1));




disp('foreground detection complete')




fg_ft = gt_ft;

fg_pa_net2fg = [fg_pa sprintf('iteration_%02d_net2fg/', 1)];


[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);

[files_fg fullfiles_fg] = loadFiles_plus(fg_pa_net2fg, fg_ft);

frames = max(size(fullfiles_gt));

store_entry = [];


fg_pa_fg2bay = [fg_pa sprintf('iteration_%02d_fg2bay/', 1)];

ROI_list = getTempROI(gt_pa, gt_ft);

for j = 1:frames
%            if j < 300
    if ROI_list(j) < 10
        fgim = double(imread(fullfiles_gt{1}));
        saveImage(fgim, fg_pa_fg2bay, files_fg{j});
    else
        im   = double(imread(fullfiles_im{j}));
        fgim = double(imread(fullfiles_fg{j}));
        gtim = double(imread(fullfiles_gt{j}));


        oldfg = fgim;

        store_temp = [];

        [TP FP FN TN] = evalution_entry(fgim,gtim);

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        store_temp = [store_temp; Re Pr Fm]


        for t = 1:num_bay
            fgim = bayesRefine(im, fgim, bay_range, bay_rate);

            [TP FP FN TN] = evalution_entry(fgim,gtim);

            Re = TP/(TP + FN);
            Pr = TP / (TP + FP);
            Fm = (2*Pr*Re)/(Pr + Re);

            store_temp = [store_temp; Re Pr Fm]

            plot(1:t + 1, store_temp(:, 3), '-o', 'Color', [0.5 0.5 1], 'LineWidth', 4)
            hold on
            plot(1:t + 1, store_temp(:, 2), '-o', 'Color', [0.5 1 0.5], 'LineWidth', 4)
            hold on
            plot(1:t + 1, store_temp(:, 1), '-o', 'Color', [1 0.5 0.5], 'LineWidth', 4)
            legend('Fm','Pr','Re', 'Location', 'southeast')
            drawnow
        end



        [TP FP FN TN] = evalution_entry(fgim,gtim);

        Re = TP/(TP + FN);
        Pr = TP / (TP + FP);
        Fm = (2*Pr*Re)/(Pr + Re);

        store_entry = [store_entry; TP FP FN TN];

        showim = emphImage_byMask(im, fgim, [200 101 100], 0.7);


        msk_idx = gtim == 85;
        fgim(msk_idx) = 85;



        saveImage(fgim, fg_pa_fg2bay, files_fg{j});


        displayMatrixImage(j, 2, 3, im, gtim, showim, oldfg, fgim, im);
        j
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

txtWrite(value, sprintf('%s_iteration_%02d_bay.txt', pa_name, 1));

