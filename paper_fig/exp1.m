clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('~/projects/matrix/common_c/');

vlen = 10;
hlen = 10;

entry_width = 360;

paper_fig = [];






tim_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/highway_pedestrians/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];







tim_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/pedestrians_highway/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];





tim_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/overpass_canoe/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];








tim_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/overpass/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/canoe_overpass/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];















tim_pa = '~/dataset/dataset2014/dataset/badWeather/blizzard/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/blizzard_skating/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];








tim_pa = '~/dataset/dataset2014/dataset/badWeather/snowFall/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/badWeather/skating/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/badWeather/skating/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/blizzard_skating/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];








tim_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/turnpike_0_5fps/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/tramCrossroad_1fps_turnpike_0_5fps/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];







tim_pa = '~/dataset/dataset2014/dataset/lowFramerate/tramCrossroad_1fps/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/lowFramerate/tunnelExit_0_35fps/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/tramCrossroad_1fps_tunnelExit_0_35fps/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];







tim_pa = '~/dataset/dataset2014/dataset/intermittentObjectMotion/abandonedBox/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/abandonedBox_highway/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];





tim_pa = '~/dataset/dataset2014/dataset/shadow/busStation/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/busStation_pedestrians/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];















tim_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fall/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/fall_highway/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];






tim_pa = '~/dataset/dataset2014/dataset/dynamicBackground/canoe/input/';
tim_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/shadow/busStation/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/shadow/busStation/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection_TestDiffTrain/canoe_busStation/iteration_01_fg2bay/';
fg_ft = 'png';


finim = createShowImg(im_pa, im_ft, gt_pa, gt_ft, fg_pa, fg_ft, tim_pa, tim_ft, entry_width, vlen, hlen);

paper_fig = [paper_fig; finim];




imwrite(uint8(paper_fig), 'paper_fig.png');


figure
displayMatrixImage(1, 1, 1, paper_fig)
