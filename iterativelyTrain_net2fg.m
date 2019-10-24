        % detect the foreground image

        net_pa_temp = [net_pa sprintf('iteration_%02d/', i)];
        
        net = load([net_pa_temp 'net-epoch-40.mat']);
        net = net.net;

        [files fullfiles] = loadFiles_plus(im_pa, im_ft);

        frames = max(size(files));

        [row_im column_im byte_im] = size(double(imread(fullfiles{1})));

        store_entry = [];
        fg_pa_net2fg = [fg_pa sprintf('iteration_%02d_net2fg/', i)];

        ROI_list = getTempROI(gt_pa, gt_ft);

        %%%%%%%%%%%%%%%%%%%%%%%
        if exist(fg_pa_net2fg) ~= 0
            [files_cur fullfiles_cur] = loadFiles_plus(fg_pa_net2fg, gt_ft);

            curmaxnum = max(size(files_cur));

            [files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);
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


                Re = TP/(TP + FN);
                Pr = TP / (TP + FP);
                Fm = (2*Pr*Re)/(Pr + Re);

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

        txtWrite(value, sprintf('%s_iteration_%02d_fg.txt', pa_name, i));


