        fg_pa_fg2bay = [fg_pa sprintf('iteration_%02d_fg2bay/', i - 1)];
%        [idxes rates] = selectRandFgFrame(fg_pa_fg2bay, fg_ft, 5);

%        for test = 1:10

        temp_list = [];

        temp_judge = 0;
        while temp_judge == 0
            [idxs_fg temp_rates] = selectFgRand(fg_pa_fg2bay, fg_ft, 6, 1.1);
    %        [idxs_fg temp_rates] = selectFgRand(fg_pa_fg2bay, fg_ft, 2);
            [idxs_bk temp_rates] = selectBkRand(fg_pa_fg2bay, fg_ft, 4);

            idxes_train = [idxs_fg; idxs_bk];

            value = sum(abs(idxs_fg - mean(idxs_fg)));
            if value > 10
                temp_judge = 1;
                temp_list = idxes_train;
                break;
            end
        end

        idxes_train = temp_list
%        input('pause')

%    end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % modified the index frames
%         idxes = getFgPeakFrames_rand(fg_pa_fg2bay, fg_ft, 1, 10);
% 
%         idxsq = getSqFrames(fg_pa_fg2bay, fg_ft, 1);
% %        idxsq = [];
% 
%         idxes_train = [idxes; idxsq ];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%         fg_pa_net2fg = [fg_pa sprintf('iteration_%02d_net2fg/', i - 1)];
%         [FN_list FP_list] = getFgBkDiff(fg_pa_net2fg, fg_ft, fg_pa_fg2bay, fg_ft);
% 
% 
%         pos = find(FN_list == max(FN_list));
%         idx_FN = pos(1);
% 
% %        FN_list(idx_FN) = 0;
% %        pos = find(FN_list == max(FN_list));
% %        idx_FN = [idx_FN; pos(1)];
% 
%         pos = find(FP_list == max(FP_list));
%         idx_FP = pos(1);
% % 
% % 
% % %        idxes_train = [idxes; idxsq; src_idx];
%         idxes_train = [idx_FN; idx_FP];

%        idxes_train = idx_FN;

        txtWrite(idxes_train, sprintf('%s_iteration_%02d_idxes.txt', pa_name, i));



        imdb = getMultiRPoTP_SG(im_pa, im_ft, fg_pa_fg2bay, fg_ft, idxes_train, radius^2, 'train', 'set');
        idxes_train
        imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'nda');



        disp('save the rates files')
        allnum = max(size(imdb.images.labels));
        saverate = [sum(imdb.images.labels == 255) / allnum   sum(imdb.images.labels == 1) / allnum]
        txtWrite(saverate, sprintf('%s_iteration_%02d_rates.txt', pa_name, i));


        disp('clear the memery after saverate')
        imdb.images.data = [];
        imdb.images.labels = [];
        % 函数用来整理内存
        pack

%        clear imdb;





%        cmdline = [net_pa sprintf('iteration_%02d/', i - 1) 'net-epoch-1.mat'];
        cmdline = [net_pa sprintf('iteration_%02d/', i)];
        cmdline = ['mkdir -p ' cmdline];
        system(cmdline);

        cmdline_l = [net_pa sprintf('iteration_%02d/', i - 1) 'net-epoch-40.mat'];
        cmdline_r = [net_pa sprintf('iteration_%02d/', i) 'net-epoch-1.mat'];
        cmdline = ['cp ' cmdline_l ' ' cmdline_r];
        system(cmdline);
        disp('copy the network from last iteration');


        net_pa_temp = [net_pa sprintf('iteration_%02d/', i)];
        
        bgs_train_multi_random(imdb, net_pa_temp);

        
        % check if anything worry for network
        imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, src_idx, radius^2, 'test', 'set');

        net = load([net_pa_temp 'net-epoch-40.mat']);
        net = net.net;

        store_temp = [];

        for cnt_idx = 1:max(size(src_idx))
            for j = 1:5
                imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, src_idx(cnt_idx), radius^2, 'test', 'set');

                imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');


                [fgim gtim] = getFgImg(net, imdb);


                [TP FP FN TN] = evalution_entry(fgim,gtim);

                Re = TP/(TP + FN);
                Pr = TP / (TP + FP);
                Fm = (2*Pr*Re)/(Pr + Re);

                temp = [Re Pr Fm]
                store_temp = [store_temp; temp];
            end
        end
        txtWrite(store_temp, sprintf('%s_iteration_%02d_network.txt', pa_name, i));


