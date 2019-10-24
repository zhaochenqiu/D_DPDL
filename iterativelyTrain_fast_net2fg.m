        % detect the foreground image
        [files fullfiles] = loadFiles_plus(im_pa, im_ft);

        frames = max(size(files));

        [row_im column_im byte_im] = size(double(imread(fullfiles{1})));

        store_entry = [];
        fg_pa_net2fg = [fg_pa sprintf('iteration_%02d_net2fg/', i)];

        for j = 1:frames
            if j < 300
                fgim = zeros(row_im, column_im) + 85;
                displayMatrixImage(j,1,2,fgim,fgim)

                str = sprintf('re%06d',j);
                str = [str '.png'];
                saveImage(fgim, fg_pa_net2fg, str);
            else
                imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, j, radius^2);
		        [fgim gtim] = getFgImg(net, imdb);

                [TP FP FN TN] = evalution_entry(fgim,gtim);
                store_entry = [store_entry; TP FP FN TN];

                Re = TP/(TP + FN);
                Pr = TP / (TP + FP);
                Fm = (2*Pr*Re)/(Pr + Re)

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

        txtWrite(value, sprintf('%s_iteration_fast_%02d_fg.txt', pa_name, i));


