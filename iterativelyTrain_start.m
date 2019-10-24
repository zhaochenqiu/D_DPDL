        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % start training the network with one groundtruth


        net_pa_temp = [net_pa sprintf('iteration_%02d/', i)];
        
        bgs_train_multi_random(imdb, net_pa_temp);

        
        % check if anything worry for network

        net = load([net_pa_temp 'net-epoch-40.mat']);
        net = net.net;

        store_temp = [];

        for cnt_idx = 1:max(size(idx))
            for j = 1:2
                imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx(cnt_idx), radius^2, 'test', 'set');

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
        store_temp = [store_temp; mean(store_temp)]
        txtWrite(store_temp, sprintf('%s_iteration_%02d_network.txt', pa_name, i));


        global g_flag_endstart;
        g_flag_endstart = 1;
