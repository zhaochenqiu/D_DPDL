function [] = iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, nums_iterative, bay_range, bay_rate)

if nargin == 6
    nums_iterative = 5;
%    bay_range = 3;
%    bay_rate = 0.8;
    bay_range = 3;
    bay_rate = 0.8;
end

if nargin == 7
    bay_range = 3;
    bay_rate = 0.8;
end


% actually, no need for this
src_idx = 0;

radius = 9;
fg_ft = 'png';

num_bay = 3;

pa_name = extractPathName(im_pa);

for i = 1:nums_iterative
    if i == 1
        % select a groundtruth to start training
        [idx rat] = selectBalFrame(gt_pa, gt_ft);
%        idx = getFgPeakFrames_rand(gt_pa, gt_ft, 1, 10 );

        src_idx = idx

        % start training the network with one groundtruth
        if exist([fg_pa sprintf('iteration_%02d_net2fg/', i)]) == 0
            iterativelyTrain_start_bal;
        else
            disp('skip iterativelyTrain_start');
        end


        % detect the foreground image
        if exist([fg_pa sprintf('iteration_%02d_fg2bay/', i)]) == 0
            iterativelyTrain_start_net2fg;
        else
            disp('skip iterativelyTrain_net2fg')
        end


        % refine the foreground image by Bayesian model
        if exist([net_pa sprintf('iteration_%02d/', i + 1)]) ==0
            iterativelyTrain_start_fg2bay;
        else
            disp('skip iterativelyTrain_fg2bay');
        end
    else
        % retrain the network after Bayesian refinement
        if exist([fg_pa sprintf('iteration_%02d_net2fg/', i)]) ==0
            iterativelyTrain_bay2net;
        else
            disp(['skip iterativelyTrain_bay2net' sprintf(' iteration = %02d', i)]);
        end

        % detect the foreground image
        if exist([fg_pa sprintf('iteration_%02d_fg2bay/', i)]) == 0
            iterativelyTrain_net2fg;
        else
            disp(['skip iterativelyTrain_net2fg' sprintf(' iteration = %02d', i)]);
        end

        % refine the foreground by Bayesian model
        if exist([net_pa sprintf('iteration_%02d/', i + 1)]) ==0
            iterativelyTrain_fg2bay;
        else
            disp(['skip iterativelyTrain_fg2bay' sprintf(' iteration = %02d', i)]);
        end
    end
end

