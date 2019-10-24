clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('./function/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')



% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
% net_path = '../network/baseline/highway/';
% 
% func_train(im_pa, gt_pa, net_path);
% 
% 





gt_pa = '~/dataset/dataset2014/dataset/badWeather/blizzard/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/badWeather/blizzard/input/'
net_path = '../network/badWeather/blizzard/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/'
net_path = '../network/badWeather/skating/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/badWeather/snowFall/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/badWeather/snowFall/input/'
net_path = '../network/badWeather/snowFall/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/badWeather/wetSnow/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/badWeather/wetSnow/input/'
net_path = '../network/badWeather/wetSnow/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/'
net_path = '../network/baseline/highway/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/'
net_path = '../network/baseline/office/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/'
net_path = '../network/baseline/pedestrians/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/'
net_path = '../network/baseline/PETS2006/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/badminton/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/cameraJitter/badminton/input/'
net_path = '../network/cameraJitter/badminton/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/input/'
net_path = '../network/cameraJitter/boulevard/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/input/'
net_path = '../network/cameraJitter/sidewalk/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/input/'
net_path = '../network/cameraJitter/traffic/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/input/'
net_path = '../network/dynamicBackground/boats/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/'
net_path = '../network/dynamicBackground/canoe/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/input/'
net_path = '../network/dynamicBackground/fall/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/'
net_path = '../network/dynamicBackground/fountain01/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/input/'
net_path = '../network/dynamicBackground/fountain02/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/'
net_path = '../network/dynamicBackground/overpass/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/input/'
net_path = '../network/intermittentObjectMotion/abandonedBox/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/input/'
net_path = '../network/intermittentObjectMotion/parking/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/input/'
net_path = '../network/intermittentObjectMotion/sofa/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/input/'
net_path = '../network/intermittentObjectMotion/streetLight/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/tramstop/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/tramstop/input/'
net_path = '../network/intermittentObjectMotion/tramstop/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/winterDriveway/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/winterDriveway/input/'
net_path = '../network/intermittentObjectMotion/winterDriveway/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/input/'
net_path = '../network/lowFramerate/port_0_17fps/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/input/'
net_path = '../network/lowFramerate/tramCrossroad_1fps/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/input/'
net_path = '../network/lowFramerate/tunnelExit_0_35fps/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/input/'
net_path = '../network/lowFramerate/turnpike_0_5fps/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/nightVideos/bridgeEntry/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/nightVideos/bridgeEntry/input/'
net_path = '../network/nightVideos/bridgeEntry/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/nightVideos/busyBoulvard/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/nightVideos/busyBoulvard/input/'
net_path = '../network/nightVideos/busyBoulvard/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/nightVideos/fluidHighway/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/nightVideos/fluidHighway/input/'
net_path = '../network/nightVideos/fluidHighway/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/nightVideos/streetCornerAtNight/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/nightVideos/streetCornerAtNight/input/'
net_path = '../network/nightVideos/streetCornerAtNight/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/input/'
net_path = '../network/nightVideos/tramStation/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/input/'
net_path = '../network/nightVideos/winterStreet/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/PTZ/continuousPan/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/PTZ/continuousPan/input/'
net_path = '../network/PTZ/continuousPan/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/PTZ/intermittentPan/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/PTZ/intermittentPan/input/'
net_path = '../network/PTZ/intermittentPan/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/PTZ/twoPositionPTZCam/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/PTZ/twoPositionPTZCam/input/'
net_path = '../network/PTZ/twoPositionPTZCam/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/PTZ/zoomInZoomOut/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/PTZ/zoomInZoomOut/input/'
net_path = '../network/PTZ/zoomInZoomOut/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/input/'
net_path = '../network/shadow/backdoor/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/input/'
net_path = '../network/shadow/bungalows/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/shadow/busStation/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/busStation/input/'
net_path = '../network/shadow/busStation/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/shadow/copyMachine/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/copyMachine/input/'
net_path = '../network/shadow/copyMachine/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/input/'
net_path = '../network/shadow/cubicle/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/shadow/peopleInShade/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/peopleInShade/input/'
net_path = '../network/shadow/peopleInShade/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/thermal/corridor/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/corridor/input/'
net_path = '../network/thermal/corridor/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/input/'
net_path = '../network/thermal/diningRoom/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/thermal/lakeSide/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/lakeSide/input/'
net_path = '../network/thermal/lakeSide/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/thermal/library/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/library/input/'
net_path = '../network/thermal/library/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/thermal/park/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/park/input/'
net_path = '../network/thermal/park/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/input/'
net_path = '../network/turbulence/turbulence0/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence1/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence1/input/'
net_path = '../network/turbulence/turbulence1/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence2/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence2/input/'
net_path = '../network/turbulence/turbulence2/'
func_train(im_pa, gt_pa, net_path);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence3/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence3/input/'
net_path = '../network/turbulence/turbulence3/'
func_train(im_pa, gt_pa, net_path);


