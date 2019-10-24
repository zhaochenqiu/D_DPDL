        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % start training the network with one groundtruth

        imdb = getMultiRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'train', 'set');
        imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'get');

        [imdb_fg imdb_bk] = divideFgBkImdb(imdb);
        imdb = balanceImdb(imdb, imdb_fg, imdb_bk);

        net_pa_temp = [net_pa sprintf('iteration_%02d/', i)];
        
        bgs_train_multi_random_bal(imdb, net_pa_temp);

        
        % check if anything worry for network
        imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'test', 'set');

        net = load([net_pa_temp 'net-epoch-40.mat']);
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
        txtWrite(store_temp, sprintf('%s_iteration_%02d_network.txt', pa_name, i));


