clear all
close all
clc

addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');
addpath('./function/');

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')



% gt_pa = '~/dataset/dataset2014/dataset/badWeather/blizzard/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/badWeather/blizzard/input/'
% net_path = '../network/badWeather/blizzard/'
% path_save = '../detection/badWeather/blizzard/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/'
% net_path = '../network/badWeather/skating/'
% path_save = '../detection/badWeather/skating/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/badWeather/snowFall/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/badWeather/snowFall/input/'
% net_path = '../network/badWeather/snowFall/'
% path_save = '../detection/badWeather/snowFall/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/badWeather/wetSnow/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/badWeather/wetSnow/input/'
% net_path = '../network/badWeather/wetSnow/'
% path_save = '../detection/badWeather/wetSnow/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/'
% net_path = '../network/baseline/highway/'
% path_save = '../detection/baseline/highway/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/'
% net_path = '../network/baseline/office/'
% path_save = '../detection/baseline/office/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/'
% net_path = '../network/baseline/pedestrians/'
% path_save = '../detection/baseline/pedestrians/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/'
% net_path = '../network/baseline/PETS2006/'
% path_save = '../detection/baseline/PETS2006/'
% func_detect(im_pa, gt_pa, net_path, path_save);


% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/badminton/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/badminton/input/'
% net_path = '../network/cameraJitter/badminton/'
% path_save = '../detection/cameraJitter/badminton/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/input/'
% net_path = '../network/cameraJitter/boulevard/'
% path_save = '../detection/cameraJitter/boulevard/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/input/'
% net_path = '../network/cameraJitter/sidewalk/'
% path_save = '../detection/cameraJitter/sidewalk/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/input/'
% net_path = '../network/cameraJitter/traffic/'
% path_save = '../detection/cameraJitter/traffic/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/boats/input/'
% net_path = '../network/dynamicBackground/boats/'
% path_save = '../detection/dynamicBackground/boats/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/'
% net_path = '../network/dynamicBackground/canoe/'
% path_save = '../detection/dynamicBackground/canoe/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/input/'
% net_path = '../network/dynamicBackground/fall/'
% path_save = '../detection/dynamicBackground/fall/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/'
% net_path = '../network/dynamicBackground/fountain01/'
% path_save = '../detection/dynamicBackground/fountain01/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain02/input/'
% net_path = '../network/dynamicBackground/fountain02/'
% path_save = '../detection/dynamicBackground/fountain02/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/'
% net_path = '../network/dynamicBackground/overpass/'
% path_save = '../detection/dynamicBackground/overpass/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/input/'
% net_path = '../network/intermittentObjectMotion/abandonedBox/'
% path_save = '../detection/intermittentObjectMotion/abandonedBox/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/parking/input/'
% net_path = '../network/intermittentObjectMotion/parking/'
% path_save = '../detection/intermittentObjectMotion/parking/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/sofa/input/'
% net_path = '../network/intermittentObjectMotion/sofa/'
w
% path_save = '../detection/intermittentObjectMotion/sofa/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/streetLight/input/'
% net_path = '../network/intermittentObjectMotion/streetLight/'
% path_save = '../detection/intermittentObjectMotion/streetLight/'
%t me knowt me know func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/tramstop/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/tramstop/input/'
% net_path = '../network/intermittentObjectMotion/tramstop/'
% path_save = '../detection/intermittentObjectMotion/tramstop/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/winterDriveway/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/winterDriveway/input/'
% net_path = '../network/intermittentObjectMotion/winterDriveway/'
% path_save = '../detection/intermittentObjectMotion/winterDriveway/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/lowFramerate/port_0_17fps/input/'
% net_path = '../network/lowFramerate/port_0_17fps/'
% path_save = '../detection/lowFramerate/port_0_17fps/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/input/'
% net_path = '../network/lowFramerate/tramCrossroad_1fps/'
% path_save = '../detection/lowFramerate/tramCrossroad_1fps/'
% func_detect(im_pa, gt_pa, net_path, path_save);


% gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/input/'
% net_path = '../network/lowFramerate/tunnelExit_0_35fps/'
% path_save = '../detection/lowFramerate/tunnelExit_0_35fps/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/input/'
% net_path = '../network/lowFramerate/turnpike_0_5fps/'
% path_save = '../detection/lowFramerate/turnpike_0_5fps/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/bridgeEntry/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/bridgeEntry/input/'
% net_path = '../network/nightVideos/bridgeEntry/'
% path_save = '../detection/nightVideos/bridgeEntry/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/busyBoulvard/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/busyBoulvard/input/'
% net_path = '../network/nightVideos/busyBoulvard/'
% path_save = '../detection/nightVideos/busyBoulvard/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/fluidHighway/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/fluidHighway/input/'
% net_path = '../network/nightVideos/fluidHighway/'
% path_save = '../detection/nightVideos/fluidHighway/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/streetCornerAtNight/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/streetCornerAtNight/input/'
% net_path = '../network/nightVideos/streetCornerAtNight/'
% path_save = '../detection/nightVideos/streetCornerAtNight/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/tramStation/input/'
% net_path = '../network/nightVideos/tramStation/'
% path_save = '../detection/nightVideos/tramStation/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/nightVideos/winterStreet/input/'
% net_path = '../network/nightVideos/winterStreet/'
% path_save = '../detection/nightVideos/winterStreet/'
% func_detect(im_pat me know, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/PTZ/continuousPan/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/PTZ/continuousPan/input/'
% net_path = '../network/PTZ/continuousPan/'
% path_save = '../detection/PTZ/continuousPan/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/PTZ/intermittentPan/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/PTZ/intermittentPan/input/'
% net_path = '../network/PTZ/intermittentPan/'
% path_save = '../detection/PTZ/intermittentPan/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/PTZ/twoPositionPTZCam/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/PTZ/twoPositionPTZCam/input/'
% net_path = '../network/PTZ/twoPositionPTZCam/'
% path_save = '../detection/PTZ/twoPositionPTZCam/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/PTZ/zoomInZoomOut/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/PTZ/zoomInZoomOut/input/'
% net_path = '../network/PTZ/zoomInZoomOut/'
% path_save = '../detection/PTZ/zoomInZoomOut/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/shadow/backdoor/input/'
% net_path = '../network/shadow/backdoor/'
% path_save = '../detection/shadow/backdoor/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/shadow/bungalows/input/'
% net_path = '../network/shadow/bungalows/'
% path_save = '../detection/shadow/bungalows/'
% func_detect(im_pa, gt_pa, net_path, path_save);
% 
% 
% gt_pa = '~/dataset/dataset2014/dataset/shadow/busStation/groundtruth/'
% im_pa = '~/dataset/dataset2014/dataset/shadow/busStation/input/'
% net_path = '../network/shadow/busStation/'
% path_save = '../detection/shadow/busStation/'
% func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/shadow/copyMachine/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/copyMachine/input/'
net_path = '../network/shadow/copyMachine/'
path_save = '../detection/shadow/copyMachine/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/cubicle/input/'
net_path = '../network/shadow/cubicle/'
path_save = '../detection/shadow/cubicle/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/shadow/peopleInShade/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/shadow/peopleInShade/input/'
net_path = '../network/shadow/peopleInShade/'
path_save = '../detection/shadow/peopleInShade/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/thermal/corridor/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/corridor/input/'
net_path = '../network/thermal/corridor/'
path_save = '../detection/thermal/corridor/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/diningRoom/input/'
net_path = '../network/thermal/diningRoom/'
path_save = '../detection/thermal/diningRoom/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/thermal/lakeSide/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/lakeSide/input/'
net_path = '../network/thermal/lakeSide/'
path_save = '../detection/thermal/lakeSide/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/thermal/library/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/library/input/'
net_path = '../network/thermal/library/'
path_save = '../detection/thermal/library/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/thermal/park/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/thermal/park/input/'
net_path = '../network/thermal/park/'
path_save = '../detection/thermal/park/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence0/input/'
net_path = '../network/turbulence/turbulence0/'
path_save = '../detection/turbulence/turbulence0/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence1/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence1/input/'
net_path = '../network/turbulence/turbulence1/'
path_save = '../detection/turbulence/turbulence1/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence2/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence2/input/'
net_path = '../network/turbulence/turbulence2/'
path_save = '../detection/turbulence/turbulence2/'
func_detect(im_pa, gt_pa, net_path, path_save);


gt_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence3/groundtruth/'
im_pa = '~/dataset/dataset2014/dataset/turbulence/turbulence3/input/'
net_path = '../network/turbulence/turbulence3/'
path_save = '../detection/turbulence/turbulence3/'
func_detect(im_pa, gt_pa, net_path, path_save);


