%% Interpolated spectrum
close all

% Load into workspace
t1 = load("0_note_violin.mat");
t11 = load("1_note_violin.mat");

t2 = load("0_note_clarinet.mat");
t21 = load("1_note_clarinet.mat");

t3 = load("0_note_saxphone.mat");
t31 = load("1_note_saxphone.mat");

% get f0 
f0_t1 = t1.FreqVecI1(t1.locs1(1));
f0_t11 = t11.FreqVecI1(t11.locs1(1));

f0_t2 = t1.FreqVecI1(t2.locs1(1));
f0_t21 = t21.FreqVecI1(t21.locs1(1));

f0_t3 = t1.FreqVecI1(t3.locs1(1));
f0_t31 = t31.FreqVecI1(t31.locs1(1));

%% Plot
figure(1)
subplot(1,1,1)
semilogx(t1.FreqVecI1, t1.interp_spec)
hold on
semilogx(t31.FreqVecI1, t31.interp_spec)
hold on
% semilogx(t3.FreqVecI1, t3.interp_spec, 'DisplayName', "saxophone")
%
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Log VQT Power Spectrum')
grid on
legend
saveas(gcf,'wout_freq_normalization_saxophone_x_x.png')

figure(2)
semilogx(t1.FreqVecI1 / f0_t1, t1.interp_spec)
hold on
semilogx(t31.FreqVecI1 / f0_t31, t31.interp_spec)
hold on
% semilogx(t3.FreqVecI1 / f0_t3, t3.interp_spec, 'DisplayName', "saxophone")
%
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Log VQT Power Spectrum')
grid on
legend
saveas(gcf,'with_freq_normalization_saxophone_x_x.png')