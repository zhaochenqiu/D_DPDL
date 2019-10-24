
run('~/tools/matconvnet-1.0-beta24/matlab/vl_setupnn.m');
addpath('~/projects/imageprocessing/common');
addpath('./function/');
rng(0)

video_result = [];




frames_train_sq = 0;
frames_train_fg =1;
frames_train_bk = 0;

len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 1;
peak_border = 1000;


global g_block g_epoch g_learningRate;
g_block = len_block;
g_epoch = 20;
g_learningRate = 0.001;

global g_batchSize;
g_batchSize = 1000;


global g_gpuindex
g_gpuindex = 1;

global g_initnetwidth;
g_initnetwidth = 32;



videos =  'baseline/pedestrians';
% run_entry






videos =  'baseline/highway';
run_entry
videos =  'baseline/office';
run_entry
videos =  'baseline/pedestrians';
run_entry
videos =  'baseline/PETS2006';
run_entry
txtWrite(video_result,'all_result_baseline.txt');




videos =  'cameraJitter/badminton';
run_entry
videos =  'cameraJitter/boulevard';
run_entry
videos =  'cameraJitter/sidewalk';
run_entry
videos =  'cameraJitter/traffic';
run_entry
txtWrite(video_result,'all_result_cameraJitter.txt');



videos =  'dynamicBackground/boats';
run_entry
videos =  'dynamicBackground/canoe';
run_entry
videos =  'dynamicBackground/fall';
run_entry
videos =  'dynamicBackground/fountain01';
run_entry
videos =  'dynamicBackground/fountain02';
run_entry
videos =  'dynamicBackground/overpass';
run_entry
txtWrite(video_result,'all_result_dynamicbackground.txt');


videos =  'intermittentObjectMotion/abandonedBox';
run_entry
videos =  'intermittentObjectMotion/parking';
run_entry
videos =  'intermittentObjectMotion/sofa';
run_entry
videos =  'intermittentObjectMotion/streetLight';
run_entry
videos =  'intermittentObjectMotion/tramstop';
run_entry
videos =  'intermittentObjectMotion/winterDriveway';
run_entry
txtWrite(video_result,'all_result_intermittentObjectMotion.txt');



videos =  'lowFramerate/port_0_17fps';
run_entry
videos =  'lowFramerate/tramCrossroad_1fps';
run_entry
videos =  'lowFramerate/tunnelExit_0_35fps';
run_entry
videos =  'lowFramerate/turnpike_0_5fps';
run_entry
txtWrite(video_result,'all_result_lowFramerate.txt');



videos =  'nightVideos/bridgeEntry';
run_entry
videos =  'nightVideos/busyBoulvard';
run_entry
videos =  'nightVideos/fluidHighway';
run_entry
videos =  'nightVideos/streetCornerAtNight';
run_entry
videos =  'nightVideos/tramStation';
run_entry
videos =  'nightVideos/winterStreet';
run_entry
txtWrite(video_result,'all_result_nightVideos.txt');


videos =  'PTZ/continuousPan';
run_entry
videos =  'PTZ/intermittentPan';
run_entry
videos =  'PTZ/twoPositionPTZCam';
run_entry
videos =  'PTZ/zoomInZoomOut';
run_entry
txtWrite(video_result,'all_result_PTZ.txt');



videos =  'shadow/backdoor';
run_entry
videos =  'shadow/bungalows';
run_entry
videos =  'shadow/busStation';
run_entry
videos =  'shadow/copyMachine';
run_entry
videos =  'shadow/cubicle';
run_entry
videos =  'shadow/peopleInShade';
run_entry
txtWrite(video_result,'all_result_shadow.txt');




videos =  'thermal/corridor';
run_entry
videos =  'thermal/diningRoom';
run_entry
videos =  'thermal/lakeSide';
run_entry
videos =  'thermal/library';
run_entry
videos =  'thermal/park';
run_entry
txtWrite(video_result,'all_result_thermal.txt');




videos =  'turbulence/turbulence0';
run_entry
videos =  'turbulence/turbulence1';
run_entry
videos =  'turbulence/turbulence2';
run_entry
videos =  'turbulence/turbulence3';
run_entry
txtWrite(video_result,'all_result_turbulence.txt');

videos =  'badWeather/blizzard'
run_entry
videos =  'badWeather/skating';
run_entry
videos =  'badWeather/snowFall';
run_entry
videos =  'badWeather/wetSnow';
run_entry
txtWrite(video_result,'all_result_badweather.txt');




videos
video_result

txtWrite(video_result,'all_result_border1.txt');
