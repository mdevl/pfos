% createBenchmarkData.m
% Author: Michael Schober (mschober@tue.mpg.de)
% Date: 2016-05-13
% Version: 0.1
% Purpose: Creates *.mat files for method comparison of Hull benchmark

% Rationale:
% - one file per criteria with same structure allows for easy plotting

%% Setup

clear;

%% Data allocation

solvers = {'Burlisch-Stoer';
           'Adams: Krogh';
           'Adams: Gear';
           'RK4: Kutta';
           'RK6: Butcher';
           'RK8: Shanks'};
         
problemsets = {'single equations';
               'small systems';
               'moderate systems';
               'orbit equations';
               'higher order equations'};
             
problemsPerSet = 5;
tolerances = [1e-3, 1e-6, 1e-9];

fcnCalls = NaN(numel(solvers), ...
               problemsPerSet, ...
               numel(problemsets), ...
               numel(tolerances));

numSteps = NaN(numel(solvers), ...
               problemsPerSet, ...
               numel(problemsets), ...
               numel(tolerances));
             
percDecv = NaN(numel(solvers), ...
                   problemsPerSet, ...
                   numel(problemsets), ...
                   numel(tolerances));
             
maxError = NaN(numel(solvers), ...
               problemsPerSet, ...
               numel(problemsets), ...
               numel(tolerances));
             
%% Fill matrices

% Hull, p. 626
fcnCalls(1,:,1,:) = ...
  [150, 126, 319, 126, 126;
   320, 154, 764, 150, 150;
   486, 341, 1469, 303, 312]';
                   
fcnCalls(2,:,1,:) = ...
  [ 63,  71, 192,  27,  58;
   149, 162, 363, 108, 144;
   247, 270, 645, 215, 250]';
                   
fcnCalls(3,:,1,:) = ...
  [114,  71, 315,  62,  62;
   182, 170, 672, 125, 141;
   359, 314, 1432, 243, 278]';
                   
numSteps(1,:,1,:) = ...
  [6, 6, 7, 6, 6;
   8, 6, 12, 6, 6;
   10, 9, 21, 7, 8]';

numSteps(2,:,1,:) = ...
  [ 36,  41,  99,  25,  58;
    79,  85, 189,  58,  76;
   156, 159, 322, 108, 122]';
                   
numSteps(3,:,1,:) = ...
  [ 46,  33, 106,  23,  30;
    76,  76, 248,  46,  67;
   136, 149, 543,  94, 131]';
      
percDecv(1,:,1,:) = ...
  [ 0.0,  0.0, 14.3,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(2,:,1,:) = ...
  [ 0.0,  0.0,  2.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(3,:,1,:) = ...
  [ 0.0,  0.0,  3.8, 17.4,  0.0;
    0.0,  0.0,  2.8,  6.5,  1.5;
    0.0,  0.0,  5.3,  2.1,  1.5]';
  
maxError(1,:,1,:) = ...
  [0.2, 0.0, 1.2, 0.0, 0.0;
   0.1, 0.1, 0.1, 0.0, 0.0;
   0.0, 0.0, 0.2, 0.0, 0.0]';
 
maxError(2,:,1,:) = ...
  [0.3, 0.0, 1.1, 0.1, 0.0;
   0.0, 0.0, 0.8, 0.0, 0.0;
   0.2, 0.0, 0.9, 0.0, 0.0]';
 
maxError(3,:,1,:) = ...
  [0.9, 1.0, 1.5, 1.3, 1.0;
   0.5, 0.3, 2.6, 1.5, 1.6;
   0.8, 0.2, 1.7, 1.3, 1.3]';
                   
% Hull, p. 627
fcnCalls(4,:,1,:) = ...
  [  77,   55,  236,   44,   44;
    286,  131, 1151,  208,  154;
   1375,  415, 4635, 1089,  784]';
                   
fcnCalls(5,:,1,:) = ...
  [120,  80, 219,  60,  60;
   260, 139, 909, 139, 120;
   680, 340, 2433, 417, 280]';
                   
fcnCalls(6,:,1,:) = ...
  [175, 140, 346,  70, 105;
   315, 175, 625, 105, 140;
   560, 315, 1080, 244, 245]';
 
numSteps(4,:,1,:) = ...
  [ 7,  5, 16,  4,  4;
   26, 11, 81, 18, 14;
   125, 35, 385, 99, 68]';
 
numSteps(5,:,1,:) = ...
  [ 6,  4, 10,  3,  3;
   13,  6, 35,  6,  6;
   34, 17, 105, 18, 14]';
 
numSteps(6,:,1,:) = ...
  [5, 4, 6, 2, 3;
   9, 5, 13, 3, 4;
   16, 9, 26, 6, 7]';
 
percDecv(4,:,1,:) = ...
  [ 0.0,  0.0,  6.3,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  2.9,  2.6,  0.0,  0.0]';
  
percDecv(5,:,1,:) = ...
  [ 0.0,  0.0, 40.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  1.9,  0.0,  0.0]';
  
percDecv(6,:,1,:) = ...
  [ 0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0, 11.5,  0.0,  0.0]';
  
maxError(4,:,1,:) = ...
  [0.4, 0.2, 1.3, 0.9, 0.3;
   0.6, 0.1, 0.9, 0.9, 0.7;
   0.6, 1.1, 2.9, 0.7, 0.7]';
 
maxError(5,:,1,:) = ...
  [0.2, 0.2, 3.3, 0.0, 0.1;
   0.4, 0.7, 1.0, 0.6, 0.4;
   0.5, 0.5, 1.1, 0.9, 0.7]';
 
maxError(6,:,1,:) = ...
  [0.1, 0.1, 0.6, 0.0, 0.0;
   0.2, 0.2, 0.3, 0.0, 0.1;
   0.3, 0.3, 2.9, 0.4, 0.6]';
 
% Hull, p. 628
fcnCalls(1,:,2,:) = ...
  [ 992,  538,  150,  461,  359;
   1873,  611,  365,  934,  780;
   3128,  896,  617, 1826, 1429]';
 
fcnCalls(2,:,2,:) = ...
  [435, 113,  87, 182, 179;
   927, 241, 228, 356, 422;
   1403, 347, 401, 696, 719]';
 
fcnCalls(3,:,2,:) = ...
  [ 646,  313,  134,  422,  391;
   1369,  403,  248,  611,  781;
   3102,  660,  561, 1598, 1590]';
 
numSteps(1,:,2,:) = ...
  [16, 10,  6,  9,  7;
   29, 11,  9, 14, 12;
   48, 16, 13, 26, 21]';
 
numSteps(2,:,2,:) = ...
  [219,  64,  49,  98,  94;
   460, 122, 115, 184, 217;
   693, 175, 174, 349, 359]';
 
numSteps(3,:,2,:) = ...
  [221, 102,  52, 146, 128;
   478, 146,  95, 208, 262;
   1056, 227, 199, 537, 531]';
 
percDecv(1,:,2,:) = ...
  [ 6.3,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(2,:,2,:) = ...
  [ 3.2,  0.0,  0.0,  0.0,  2.1;
    2.2,  0.0,  0.0,  0.0,  4.6;
    0.3,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(3,:,2,:) = ...
  [ 0.5,  0.0,  0.0,  0.0,  0.0;
    0.4,  0.0,  0.0,  0.0,  0.0;
    2.9,  0.0,  1.5,  0.0,  0.0]';
  
maxError(1,:,2,:) = ...
  [7.8, 0.3, 0.4, 0.1, 0.0;
   0.0, 0.1, 0.3, 0.1, 0.1;
   0.0, 0.0, 0.0, 0.0, 0.0]';
 
maxError(2,:,2,:) = ...
  [2.4, 0.3, 0.4, 0.1, 1.2;
   1.5, 0.1, 0.0, 0.1, 1.8;
   2.1, 0.2, 0.1, 0.2, 0.1]';
 
maxError(3,:,2,:) = ...
  [1.2, 0.7, 0.6, 0.8, 0.8;
   1.3, 0.5, 0.6, 0.3, 0.5;
   1.4, 0.5, 1.2, 0.5, 0.9]';
 
% Hull, p. 629
fcnCalls(4,:,2,:) = ...
  [ 665,  206,   99,  336,  307;
   2710,  440,  363, 1590, 1189;
   13266, 2156, 1749, 8558, 5225]';
 
fcnCalls(5,:,2,:) = ...
  [ 808,  357,  140,  356,  335;
   1836,  478,  300,  877,  908;
   4458, 1040,  800, 2580, 2264]';
 
fcnCalls(6,:,2,:) = ...
  [1248,  521,  278,  349,  486;
   1528,  559,  315,  699,  764;
   3130,  875,  630, 1539, 1634]';
 
numSteps(4,:,2,:) = ...
  [ 45,  16,   9,  26,  17;
   220,  40,  33, 140,  89;
   1206, 196, 159, 778, 475]';
 
numSteps(5,:,2,:) = ...
  [29, 15,  7, 14, 12;
   69, 22, 15, 41, 34;
   202, 52, 40, 129, 98]';
 
numSteps(6,:,2,:) = ...
  [24, 11,  6,  9, 10;
   32, 15,  9, 19, 16;
   70, 25, 18, 43, 36]';
 
percDecv(4,:,2,:) = ...
  [15.6,  6.3,  0.0, 11.5, 23.5;
    5.9,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(5,:,2,:) = ...
  [ 3.4, 13.3,  0.0,  0.0,  0.0;
    1.4,  0.0,  0.0,  7.3,  2.9;
    5.4,  0.0,  0.0,  0.0,  9.2]';
  
percDecv(6,:,2,:) = ...
  [ 0.0,  0.0,  0.0,  0.0,  0.0;
   12.5,  0.0,  0.0,  0.0,  0.0;
    5.7,  0.0,  0.0,  0.0,  8.3]';
  
maxError(4,:,2,:) = ...
  [1.7, 4.5, 0.5, 1.2, 1.7;
   1.1, 0.9, 0.6, 1.0, 1.0;
   0.9, 0.6, 0.7, 0.8, 0.9]';
 
maxError(5,:,2,:) = ...
  [1.5, 120.8, 0.3, 0.6, 0.5;
   1.1, 0.7, 0.5, 1.2, 1.0;
   1.2, 0.5, 0.6, 0.9, 1.2]';
 
maxError(6,:,2,:) = ...
  [0.1, 0.7, 0.0, 1.0, 0.4;
   4.7, 0.8, 0.3, 0.7, 0.9;
   2.2, 0.3, 0.3, 0.9, 1.3]';
 
% Hull, p. 630
fcnCalls(1,:,3,:) = ...
  [ 279, 1894,  579,  812,  138;
    645, 1811,  730, 1074,  178;
   1140, 2250, 1099, 1450,  356]';
 
fcnCalls(2,:,3,:) = ...
  [ 99, 210, 129, 125,  24;
   252, 443, 272, 288,  79;
   437, 750, 453, 453, 157]';
 
fcnCalls(3,:,3,:) = ...
  [211, 781, 376, 387,  78;
   443, 961, 517, 582, 172;
   890, 1545, 893, 1115, 339]';
 
numSteps(1,:,3,:) = ...
  [ 7, 26, 11, 17,  6;
   13, 27, 14, 23,  6;
   20, 36, 19, 30,  8]';
 
numSteps(2,:,3,:) = ...
  [ 55, 112,  70,  68,  17;
   126, 220, 135, 142,  44;
   191, 343, 198, 198,  78]';
 
numSteps(3,:,3,:) = ...
  [ 76, 225, 126, 124,  25;
   154, 319, 182, 196,  58;
   286, 508, 297, 352, 111]';
 
percDecv(1,:,3,:) = ...
  [ 0.0,  7.7,  9.1,  0.0,  0.0;
    0.0,  3.7,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(2,:,3,:) = ...
  [ 0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  8.1,  2.1,  0.0;
    0.0,  1.5,  2.5,  0.5,  0.0]';
  
percDecv(3,:,3,:) = ...
  [ 0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.7,  0.6,  0.0]';
  
maxError(1,:,3,:) = ...
  [0.2, 2.9, 1.5, 0.9, 0.0;
   0.0, 2.3, 0.5, 0.9, 0.0;
   0.0, 0.4, 0.2, 0.6, 0.0]';
 
maxError(2,:,3,:) = ...
  [0.2, 0.4, 0.4, 0.4, 0.3;
   0.3, 0.7, 2.0, 1.6, 0.1;
   0.4, 3.5, 1.4, 1.1, 0.5]';
 
maxError(3,:,3,:) = ...
  [0.8, 0.7, 0.7, 0.1, 0.6;
   0.4, 0.3, 0.4, 0.1, 0.6;
   0.3, 0.4, 1.1, 1.1, 0.4]';
 
% Hull, p. 631
fcnCalls(4,:,3,:) = ...
  [ 110,  525,  226,  226,   44;
    451,  708,  449,  449,  154;
   2343, 2618, 2002, 2002,  847]';
 
fcnCalls(5,:,3,:) = ...
  [ 179, 1027,  416,  416,   60;
    380, 1048,  518,  518,  120;
   1060, 1574, 1000, 1000,  380]';
 
fcnCalls(6,:,3,:) = ...
  [279, 1354, 557, 557,  70;
   420, 1356, 662, 662, 105;
   805, 1605, 944, 944, 210]';
 
numSteps(4,:,3,:) = ...
  [ 10,  35,  16,  16,   4;
    41,  58,  39,  39,  14;
   213, 238, 182, 182,  77]';
 
numSteps(5,:,3,:) = ...
  [ 8, 39, 17, 17,  3;
   19, 41, 24, 24,  6;
   53, 73, 50, 50, 19]';
 
numSteps(6,:,3,:) = ...
  [ 7, 28, 13, 13,  2;
   12, 30, 16, 16,  3;
   23, 41, 26, 26,  6]';

percDecv(4,:,3,:) = ...
  [ 0.0, 14.3, 12.5, 12.5,  0.0;
    0.0,  3.4,  2.6,  2.6,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(5,:,3,:) = ...
  [ 0.0, 17.9, 11.8, 11.8,  0.0;
    0.0,  9.8,  4.2,  4.2,  0.0;
    0.0,  1.4,  0.0,  0.0,  0.0]';
  
percDecv(6,:,3,:) = ...
  [ 0.0, 10.7,  7.7,  7.7,  0.0;
    0.0, 10.0,  0.0,  0.0,  0.0;
    0.0,  4.9,  3.8,  3.8,  0.0]';
  
maxError(4,:,3,:) = ...
  [0.4, 25.9, 22.8, 23.9, 0.8;
   0.8, 29.1, 4.3, 4.3, 0.7;
   0.8, 1.0, 0.6, 0.6, 0.7]';
 
maxError(5,:,3,:) = ...
  [0.8, 1788.1, 143.1, 147.2, 0.2;
   0.4, 54.4, 142.2, 142.5, 0.6;
   0.6, 443.4, 0.5, 0.5, 0.6]';
 
maxError(6,:,3,:) = ...
  [0.4, 17.5, 3.5, 1.3, 0.2;
   0.2, 2.7, 0.6, 0.6, 0.4;
   0.3, 20.9, 1.0, 1.4, 0.4]';
 
% Hull, p. 632
fcnCalls(1,:,4,:) = ...
  [ 590,  659,  841, 1664, 3581;
   1129, 1324, 1750, 3031, 4810;
   2118, 2262, 3378, 4283, 6713]';
 
fcnCalls(2,:,4,:) = ...
  [ 178,  281,  425,  556,  961;
    357,  601,  869, 1145, 1823;
    647,  981, 1286, 1906, 2789]';
  
fcnCalls(3,:,4,:) = ...
  [ 385,  497,  585,  816, 1212;
    775, 1044, 1303, 1673, 2694;
   1581, 2139, 2819, 3711, 5990]';
 
numSteps(1,:,4,:) = ...
  [10, 11, 13, 22, 43;
   17, 20, 24, 40, 62;
   30, 34, 48, 62, 99]';
 
numSteps(2,:,4,:) = ...
  [ 94, 141, 212, 280, 473;
   185, 309, 434, 568, 903;
   325, 489, 636, 939, 1369]';
 
numSteps(3,:,4,:) = ...
  [133, 167, 206, 297, 484;
   260, 347, 449, 630, 1042;
   523, 706, 960, 1371, 2419]';
 
percDecv(1,:,4,:) = ...
  [ 0.0,  0.0,  7.7,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]';
  
percDecv(2,:,4,:) = ...
  [ 0.0,  2.8,  0.5,  1.8,  1.7;
    0.0,  0.0,  0.2,  0.0,  0.2;
    0.6,  0.0,  0.2,  0.1,  0.1]';
  
percDecv(3,:,4,:) = ...
  [ 0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.3,  4.5;
    0.0,  2.8,  5.3,  7.4,  5.3]';
  
maxError(1,:,4,:) = ...
  [0.0, 0.1, 1.0, 0.2, 0.1;
   0.0, 0.0, 0.1, 0.0, 0.3;
   0.1, 0.0, 0.0, 0.0, 0.1]';
 
maxError(2,:,4,:) = ...
  [0.6, 1.7, 1.9, 1.6, 2.8;
   0.7, 0.9, 1.0, 0.8, 1.2;
   1.3, 0.8, 1.3, 1.1, 1.2]';
 
maxError(3,:,4,:) = ...
  [0.7, 0.8, 0.9, 1.0, 0.7;
   0.3, 0.4, 0.5, 1.1, 1.5;
   0.9, 1.3, 1.4, 1.6, 1.5]';

% Hull, p. 633
fcnCalls(4,:,4,:) = ...
  [ 343,  387,  515,  794, 1556;
   1177, 1533, 2122, 3086, 5748;
   6490, 7458, 9688, 13943, 27362]';
 
fcnCalls(5,:,4,:) = ...
  [ 415,  590,  786, 1041, 1982;
    898, 1346, 1779, 2469, 4166;
   2700, 3180, 4437, 6154, 10299]';
 
fcnCalls(6,:,4,:) = ...
  [ 315,  588,  279, 1138, 1073;
    871, 1146, 1390, 1946, 3300;
   1680, 2434, 3022, 3858, 6428]';
 
numSteps(4,:,4,:) = ...
  [ 23,  27,  35,  54, 106;
   107, 123, 162, 236, 458;
   590, 678, 878, 1263, 2482]';
 
numSteps(5,:,4,:) = ...
  [ 16,  20,  26,  34,  63;
    43,  54,  69,  94, 157;
   135, 159, 200, 264, 438]';
 
numSteps(6,:,4,:) = ...
  [ 9, 10,  7, 16, 19;
   21, 24, 30, 42, 70;
   48, 54, 64, 84, 138]';

percDecv(4,:,4,:) = ...
  [ 0.0,  0.0,  8.6,  5.6,  3.8;
    0.0,  9.8, 11.7,  4.2,  2.4;
    0.0,  0.0,  0.3,  0.2,  1.9]';
  
percDecv(5,:,4,:) = ...
  [ 0.0,  0.0,  3.8, 23.5,  0.0;
    0.0,  1.9,  0.0,  1.1,  0.0;
    0.0,  0.0,  0.5,  1.5,  1.1]';
  
percDecv(6,:,4,:) = ...
  [44.4, 30.0, 14.3, 18.8, 10.5;
   14.3, 12.5,  3.3,  7.1,  0.0;
    0.0,  1.9,  0.0,  4.8,  1.4]';
  
maxError(4,:,4,:) = ...
  [0.7, 0.8, 1.5, 1.6, 1.8;
   0.9, 1.3, 1.4, 1.1, 1.1;
   0.7, 0.8, 1.1, 1.3, 1.4]';
 
maxError(5,:,4,:) = ...
  [0.4, 0.9, 1.0, 3.6, 0.8;
   0.9, 1.0, 0.9, 1.1, 0.8;
   0.7, 0.9, 1.0, 1.0, 1.0]';
 
maxError(6,:,4,:) = ...
  [1.2, 8.9, 262.5, 379.7, 1120.6;
   1.9, 2.5, 1.7, 2.1, 1.0;
   0.9, 1.1, 1.0, 1.2, 1.1]';
 
% Hull, p. 634
fcnCalls(1,:,5,:) = ...
  [ 258, 1109,  550,  126,  126;
    513, 2009, 1295,  150,  154;
   1024, 3588, 2134,  206,  246]';
 
fcnCalls(2,:,5,:) = ...
  [ 103,  507,  339,   26,   24;
    222, 1022,  740,   65,   75;
    414, 1833, 1433,  117,  135]';
  
fcnCalls(3,:,5,:) = ...
  [221, 843, 462,  47,  66;
   449, 1684, 911, 115, 130;
   736, 3738, 2348, 192, 266]';
 
numSteps(1,:,5,:) = ...
  [ 6, 17, 10,  6,  6;
    9, 29, 19,  6,  6;
   16, 52, 30,  6,  6]';
 
numSteps(2,:,5,:) = ...
  [ 56, 258, 177,  16,  15;
   115, 510, 368,  42,  41;
   220, 909, 684,  70,  69]';
 
numSteps(3,:,5,:) = ...
  [ 79, 282, 160,  16,  21;
   151, 583, 310,  43,  46;
   257, 1249, 791,  66,  81]';
 
percDecv(1,:,5,:) = ...
  [ 0.0,  5.9,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0;
    0.0,  0.0,  0.0,  0.0,  0.0]'; 
  
percDecv(2,:,5,:) = ...
  [ 0.0,  0.0,  0.0,  0.0, 13.3;
    0.0,  0.0,  0.0,  0.0, 17.1;
    0.0,  0.0,  0.0,  0.0,  7.2]';
  
percDecv(3,:,5,:) = ...
  [ 0.0,  0.7,  0.0,  0.0,  0.0;
    0.0,  2.7,  0.0,  0.0,  0.0;
    0.0,  8.3,  4.4,  1.5,  8.6]';
 
maxError(1,:,5,:) = ...
  [0.0, 1.8, 0.1, 0.0, 0.0;
   0.0, 0.6, 0.0, 0.0, 0.0;
   0.0, 0.0, 0.4, 0.0, 0.0]';
 
maxError(2,:,5,:) = ...
  [0.2, 0.8, 0.1, 0.0, 5.3;
   0.3, 0.5, 0.0, 0.1, 7.3;
   0.0, 0.4, 0.0, 0.2, 4.0]';
 
maxError(3,:,5,:) = ...
  [0.0, 0.0, 0.0, 0.0, 0.0;
   0.0, 0.0, 0.0, 0.0, 0.0;
   0.0, 0.0, 0.0, 0.0, 0.0]';

% Hull, p. 635
fcnCalls(4,:,5,:) = ...
  [154, 874, 454,  43,  43;
   814, 3399, 2100, 119, 232;
   4543, 15512, 11007, 494, 737]';
 
fcnCalls(5,:,5,:) = ...
  [ 180,  887,  511,   40,   40;
    520, 2445, 1092,  118,  157;
   1620, 5902, 3416,  239,  391]';
 
fcnCalls(6,:,5,:) = ...
  [ 210, 1179,  898,   70,   70;
    455, 1909,  768,  139,  139;
   1015, 3927, 2019,  243,  277]';
 
numSteps(4,:,5,:) = ...
  [ 14,  54,  34,   3,   3;
    74, 259, 180,   9,  12;
   413, 1402, 997,  44,  67]';
 
numSteps(5,:,5,:) = ...
  [ 9, 32, 17,  2,  2;
   26, 89, 47,  4,  5;
   81, 259, 148, 11, 11]';
 
numSteps(6,:,5,:) = ...
  [ 6, 23, 14,  2,  2;
   13, 39, 20,  3,  3;
   29, 85, 47,  5,  5]';
 
percDecv(4,:,5,:) = ...
  [ 0.0,  7.4,  0.0,  0.0,  0.0;
    0.0,  1.9,  0.0,  0.0,  0.0;
    0.0,  0.2,  0.0,  0.0,  0.0]';
  
percDecv(5,:,5,:) = ...
  [ 0.0,  3.1,  0.0,  0.0,  0.0;
    0.0,  1.1,  6.4,  0.0,  0.0;
    0.0,  0.8,  1.4,  0.0,  0.0]';
  
percDecv(6,:,5,:) = ...
  [ 0.0, 13.0,  0.0,  0.0,  0.0;
    0.0, 12.8,  0.0, 33.3,  0.0;
    0.0,  5.9,  0.0,  0.0,  0.0]';
  
maxError(4,:,5,:) = ...
  [0.7, 1.8, 0.9, 0.2, 0.6;
   0.8, 1.2, 1.0, 0.8, 0.8;
   0.9, 1.3, 1.0, 0.8, 0.8]';
 
maxError(5,:,5,:) = ...
  [0.5, 1.4, 0.4, 0.2, 0.7;
   0.8, 1.2, 1.1, 0.5, 0.5;
   0.7, 1.0, 1.1, 0.7, 0.5]';
 
maxError(6,:,5,:) = ...
  [0.5, 3.9, 0.0, 0.0, 0.0;
   0.5, 2.3, 0.7, 2.2, 0.2;
   0.6, 10.2, 0.9, 0.4, 0.2]';
 
%% create data from Matlab

opts = odeset('NormControl', 'off', 'MaxStep', 20);

matlabSolvers = {@ode23hbm, @ode45hbm, @ode113hbm};
% matlabSolvers = {@ode45hbm};
odes = hullBenchmark;

for s=1:numel(matlabSolvers)
  
  thisSolver = matlabSolvers{s};
  
  thisFcnCalls = NaN(numel(odes), numel(tolerances));
  thisNumSteps = NaN(numel(odes), numel(tolerances));
  thisPercDecv = NaN(numel(odes), numel(tolerances));
  thisMaxError = NaN(numel(odes), numel(tolerances));
  
  for i=1:numel(odes)
    
    thisOde = odes{i};
    
    for t=1:numel(tolerances)
      
      thisTol = tolerances(t);
      
      opts = odeset(opts, 'AbsTol', thisTol, 'RelTol', 1e-13);
      
      opts.EPUS = 'on';
      sol = thisSolver(thisOde.fun, thisOde.tspan, thisOde.x0, opts);
      
      thisFcnCalls(i,t) = sol.stats.nfevals;
      thisNumSteps(i,t) = sol.stats.nsteps;
      
      thisBMStats  = evalSolHull(thisOde, sol.x.', sol.y.', thisTol, 1);
      
      thisPercDecv(i,t) = thisBMStats{3};
      thisMaxError(i,t) = thisBMStats{4};
      
    end % tolerances
  end % odes
  
  fcnCalls = cat(1, fcnCalls, reshape(thisFcnCalls, [1, problemsPerSet, ...
                                                     numel(problemsets), ...
                                                     numel(tolerances)]));
                                                   
  numSteps = cat(1, numSteps, reshape(thisNumSteps, [1, problemsPerSet, ...
                                                     numel(problemsets), ...
                                                     numel(tolerances)]));
                                                   
  percDecv = cat(1, percDecv, reshape(thisPercDecv, [1, problemsPerSet, ...
                                                     numel(problemsets), ...
                                                     numel(tolerances)]));
                                                   
  maxError = cat(1, maxError, reshape(thisMaxError, [1, problemsPerSet, ...
                                                     numel(problemsets), ...
                                                     numel(tolerances)]));
                                                   
  solvers = cat(1, solvers, sol.solver);
end % solvers
 
%% store data

thisfile = mfilename('fullpath');
thispath = fileparts(thisfile);
datadir  = fullfile(thispath, 'data');

criterion = 'FCN CALLS';
data = fcnCalls;
save(fullfile(datadir, 'fcnCalls.mat'), 'data', 'criterion', ...
  'solvers', 'problemsets', 'problemsPerSet', 'tolerances');

criterion = 'NUM OF STEPS';
data = numSteps;
save(fullfile(datadir, 'numSteps.mat'), 'data', 'criterion', ...
  'solvers', 'problemsets', 'problemsPerSet', 'tolerances');

criterion = '% DECEIVED';
data = percDecv;
save(fullfile(datadir, 'percDecv.mat'), 'data', 'criterion', ...
  'solvers', 'problemsets', 'problemsPerSet', 'tolerances');

criterion = 'MAX ERROR';
data = maxError;
save(fullfile(datadir, 'maxError.mat'), 'data', 'criterion', ...
  'solvers', 'problemsets', 'problemsPerSet', 'tolerances');