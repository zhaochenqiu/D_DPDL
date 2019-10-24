function [] = func_train(im_pa, gt_pa, net_path)

im_ft = 'jpg';

gt_ft = 'png';

[idx gt]= pickFrame(gt_pa, gt_ft);


net_name = [net_path 'net-epoch-100.mat'];

radius = 9;
idx_num = idx;

imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx_num, radius^2, 'train', 'set');
imdb = getRPoTP_SG([], [], [], [], [], [], [],'get');


bgs_train_random(imdb, net_path);



% test the performance
imdb = getRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx_num, radius^2, 'test', 'set');

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

txtWrite(store_temp, [net_path  'testing.txt']);
txtWrite(idx, [net_path  'idx.txt']);
store_temp

