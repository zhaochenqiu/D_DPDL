clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('./function/imdb_difference/');
addpath('./function/bayesian/');
addpath('../common/');
addpath('../common_c/');

 

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')


% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/baseline/highway/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/highway_pedestrians/';
% 
% 
% % testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/baseline/pedestrians/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/pedestrians_highway/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);



% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/canoe/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/canoe_overpass/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/overpass/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/overpass_canoe/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/boats/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/boats_canoe/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/fall/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/fall_overpass/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 


% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/shadow/peopleInShade/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/peopleInShade_backdoor/';


% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);



% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/shadow/copyMachine/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/copyMachine_backdoor/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/shadow/backdoor/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/shadow/peopleInShade/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/peopleInShade/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/backdoor_peopleInShade/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/shadow/backdoor/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/backdoor_bungalows/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);


% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/shadow/backdoor/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/shadow/busStation/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/busStation/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/backdoor_busStation/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/thermal/library/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/thermal/corridor/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/thermal/corridor/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/library_corridor/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/thermal/diningRoom/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/thermal/library/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/thermal/library/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/diningRoom_library/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/thermal/library/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/thermal/park/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/thermal/park/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/library_park/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/thermal/park/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/thermal/corridor/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/thermal/corridor/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/park_corridor/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/thermal/corridor/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/corridor_diningRoom/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/intermittentObjectMotion/abandonedBox/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/abandonedBox_sofa/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/intermittentObjectMotion/abandonedBox/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/abandonedBox_streetLight/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/intermittentObjectMotion/sofa/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/sofa_streetLight/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/intermittentObjectMotion/streetLight/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/streetLight_sofa/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/cameraJitter/badminton/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/badminton_traffic/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/cameraJitter/badminton/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/badminton_sidewalk/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/cameraJitter/boulevard/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/boulevard_sidewalk/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/cameraJitter/sidewalk/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/sidewalk_boulevard/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/badWeather/blizzard/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/blizzard_skating/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/badWeather/snowFall/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/snowFall_skating/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/badWeather/wetSnow/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/wetSnow_skating/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/nightVideos/wetSnow/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/wetSnow_skating/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/nightVideos/winterStreet/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/winterStreet_tramStation/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/nightVideos/tramStation/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/tramStation_winterStreet/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/lowFramerate/tramCrossroad_1fps/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/tramCrossroad_1fps_tunnelExit_0_35fps/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/lowFramerate/tramCrossroad_1fps/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/tramCrossroad_1fps_turnpike_0_5fps/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 
% 
% 
% net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/lowFramerate/tunnelExit_0_35fps/iteration_01/net-epoch-40.mat';
% 
% im_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/input/';
% im_ft = 'jpg';
% 
% gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/groundtruth/';
% gt_ft = 'png';
% 
% fg_pa = '~/projects/matrix/detection_TestDiffTrain/tunnelExit_0_35fps_turnpike_0_5fps/';
% 
% 
% testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);
% 



net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/shadow/backdoor/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/backdoor_highway/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);





net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/shadow/busStation/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/busStation_pedestrians/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);




net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/canoe/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/shadow/busStation/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/shadow/busStation/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/canoe_busStation/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);




net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/boats/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/boats_cubicle/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);




net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/intermittentObjectMotion/abandonedBox/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/abandonedBox_highway/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);







net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/fall/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/fall_highway/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);





net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/overpass/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/overpass_highway/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);





net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/fountain01/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/fountain01_parking/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);







net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/dynamicBackground/fall/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/fall_bungalows/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);






net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/cameraJitter/sidewalk/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/shadow/busStation/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/shadow/busStation/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/sidewalk_busStation/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);






net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/cameraJitter/badminton/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/badminton_cubicle/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);




net_pa = '~/projects/matrix/paper_results/network_10fs/iterative/cameraJitter/boulevard/iteration_01/net-epoch-40.mat';

im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/boulevard_streetLight/';


testingNeqTrain(net_pa, im_pa, im_ft, gt_pa, gt_ft, fg_pa);


