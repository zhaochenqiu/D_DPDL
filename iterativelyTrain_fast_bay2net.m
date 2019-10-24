        fg_pa_fg2bay = [fg_pa sprintf('iteration_%02d_fg2bay/', i - 1)];
        [idxes rates] = selectRandFgFrame(fg_pa_fg2bay, fg_ft, 5);
        idxsq = getSqFrames(fg_pa_fg2bay, fg_ft, 2);
        
        idxes_train = [idxes; idxsq; src_idx];


        imdb = getMultiRPoTP_SG(im_pa, im_ft, fg_pa_fg2bay, fg_ft, idxes_train, radius^2, 'train', 'set');
        imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'get');

        net_pa_temp = [net_pa sprintf('iteration_%02d/', i)];
        
        bgs_train_multi_random(imdb, net_pa_temp);

        
        % check if anything worry for network
        imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, src_idx, radius^2, 'test', 'set');

        net = load([net_pa_temp 'net-epoch-60.mat']);
        net = net.net;

        store_temp = [];
        for j = 1:5
            imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');


            [fgim gtim] = getFgImg(net, imdb);


            [TP FP FN TN] = evalution_entry(fgim,gtim);

            Re = TP/(TP + FN);
            Pr = TP / (TP + FP);
            Fm = (2*Pr*Re)/(Pr + Re);

            temp = [Re Pr Fm]
            store_temp = [store_temp; temp];
        end
        txtWrite(store_temp, sprintf('%s_iteration_fast_%02d_network.txt', pa_name, i));


