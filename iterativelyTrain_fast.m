function [] = iterativelyTrain_fast(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, nums_iterative, bay_range, bay_rate)

if nargin == 6
    nums_iterative = 5;
%    bay_range = 3;
%    bay_rate = 0.8;
    bay_range = 4;
    bay_rate = 0.6;
end

% 循环训练的加速版，不对整个视频检测，只检测是第一次的

% actually, no need for this
src_idx = 0;

radius = 9;
fg_ft = 'png';

num_bay = 3;

pa_name = extractPathName(im_pa);

list_idxes_train = [];
list_train_pa = [];

for i = 1:nums_iterative
    if i == 1
        % select a groundtruth to start training
        [idx rat] = selectBalFrame(gt_pa, gt_ft);
        src_idx = idx;

        % start training the network with one groundtruth
        if exist([fg_pa sprintf('iteration_%02d_net2fg/', i)]) == 0
            iterativelyTrain_fast_start;
        else
            disp('skip iterativelyTrain_start');
        end


        % detect the foreground image
        if exist([fg_pa sprintf('iteration_%02d_net2fg/', i)]) == 0
            iterativelyTrain_fast_start_net2fg;
        else
            disp('skip iterativelyTrain_net2fg')
        end

        fg_pa_fg2bay = [fg_pa sprintf('iteration_%02d_net2fg/', i)];
        [idxes rates] = selectRandFgFrame(fg_pa_fg2bay, fg_ft, 5);
        idxsq = getSqFrames(fg_pa_fg2bay, fg_ft, 2, 0.0001);
        idxes_train = [idxes; idxsq; src_idx];

        list_idxes_train = idxes_train;
        list_train_pa = fg_pa_fg2bay;



        % refine the foreground image by Bayesian model
        if exist([net_pa sprintf('iteration_%02d/', i + 1)]) ==0
            iterativelyTrain_fast_start_fg2bay;
        else
            disp('skip iterativelyTrain_fg2bay');
        end
    else
        % retrain the network after Bayesian refinement
        if exist([fg_pa sprintf('iteration_%02d_net2fg/', i)]) ==0
            iterativelyTrain_fast_bay2net;
        else
            disp(['skip iterativelyTrain_bay2net' sprintf(' iteration = %02d', i)]);
        end

        % detect the foreground image
        if exist([fg_pa sprintf('iteration_%02d_fg2bay/', i)]) == 0
            iterativelyTrain_fast_net2fg;
        else
            disp(['skip iterativelyTrain_net2fg' sprintf(' iteration = %02d', i)]);
        end


        fg_pa_fg2bay = [fg_pa sprintf('iteration_%02d_net2fg/', i)];
        [idxes rates] = selectRandFgFrame(fg_pa_fg2bay, fg_ft, 5);
        idxsq = getSqFrames(fg_pa_fg2bay, fg_ft, 2, 0.0001);
        idxes_train = [idxes; idxsq; src_idx];

        list_idxes_train = idxes_train;
        list_train_pa = fg_pa_fg2bay;


        % refine the foreground by Bayesian model
        if exist([net_pa sprintf('iteration_%02d/', i + 1)]) ==0
            iterativelyTrain_fast_fg2bay;
        else
            disp(['skip iterativelyTrain_fg2bay' sprintf(' iteration = %02d', i)]);
        end
    end
end

