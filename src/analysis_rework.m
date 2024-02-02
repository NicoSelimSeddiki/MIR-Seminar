clc
clear

%% INPUT SIGNAL
groundtruths = load('01-AchGottundHerr-GTF0s.mat');
[x,fs] = audioread('01-AchGottundHerr-clarinet.wav'); 

% https://www.inspiredacoustics.com/en/MIDI_note_numbers_and_center_frequencies

% for this time range, the note should be a c'' with ~523.25Hz
x1 = x(9702:37794);

% for this time range, the note should be a c'' with ~493.88Hz
% x1 = x(37794:50000);

% GT = 523.25;
% GT = 493.88;
GT = 392.00;

fmin = GT / 2^2;
fmax = fmin * (2^5);
% fmax = 3139.5;

B = 12;
d = 16;
cf = 19;
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
    Ures_LogP_absCQT, Ures_FreqVec, VAD] = cqcc(x1, fs, B, fmax, fmin, d,...
    cf, ZsdD, f_d, vad, preE, arte, yw_cf, cmvn);


