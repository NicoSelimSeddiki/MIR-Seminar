% Usage example of cqcc v2.0 function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2016 EURECOM, France.
%
% This work is licensed under the Creative Commons
% Attribution-NonCommercial-ShareAlike 4.0 International
% License. To view a copy of this license, visit
% http://creativecommons.org/licenses/by-nc-sa/4.0/
% or send a letter to
% Creative Commons, 444 Castro Street, Suite 900,
% Mountain View, California, 94041, USA.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
% close all

groundtruths = load('01-AchGottundHerr-GTF0s.mat');

%% INPUT SIGNAL
% [x,fs] = audioread('D18_1000001.wav'); % from ASVspoof2015 database
[x,fs] = audioread('01-AchGottundHerr-violin.wav'); 

% for this time range, the note should be a c'' with ~523.25Hz
% x = x(9702:37794);

% for this time range, the note should be a h' with  ~493.88Hz%
x = x(37794:112590);

%% PARAMETERS
B = 96;
fmax = fs/2;
fmin = fmax/2^9;
d = 16;
cf = 19;
%ZsdD = 'ZsdD';
ZsdD = 'Zs';

f_d = 2;
vad = 1;
preE = 1;
arte = 1;
yw_cf = 3; 
cmvn = 0;

%% COMPUTE CQCC FEATURES
% here we just wanted the first note of the recording   
[CQcc, LogP_absCQT, TimeVec, FreqVec, ...
    Ures_LogP_absCQT, Ures_FreqVec, VAD] = cqcc(x, fs, B, fmax, fmin, d,...
    cf, ZsdD, f_d, vad, preE, arte, yw_cf, cmvn);

figure(3)
plotnsgtf(CQcc', Ures_FreqVec, fs, fmin, fmax, B)
% saveas(gcf,'violin_h.png')

% save('1_note_saxophone.mat', "FreqVecI1", "interp_spec", "locs1");
