clc; clear; close all;
[bird, fs] = audioread('loon.wav');

figure;
plot((1:length(bird))/fs, bird);
title('Time Domain Signal');

%FFT
n = length(bird);
Y = fft(bird);
f = (-n/2:n/2-1)*(fs/n);
absY = fftshift(abs(Y));
figure;
plot(f, absY);
title('Frequency Spectrum');

%Welch
[pxx, f_welch] = pwelch(bird, fs);
figure;
plot(f_welch, 10*log10(pxx));
title('Power Spectral Density');

%Spectrogram
figure;
pspectrum(bird, fs, 'spectrogram');
title('Spectrogram');

%Gaussian
strength = 0.1;
noise = strength * randn(size(bird));
noisebird = bird + noise;

%FIR
nyquist = fs / 2;
order = 100;
fc = [500 1500] / nyquist;
b = fir1(order, fc, 'bandpass');

denoised_signal = filter(b, 1, noisebird);

delay = order / 2;
noisy_signal_compensated = noisebird(delay+1:end);
denoised_signal_compensated = denoised_signal(delay+1:end);
bird = bird(1:length(denoised_signal_compensated));
noisy_signal_compensated = noisy_signal_compensated(1:length(denoised_signal_compensated));

SNR_noisy = snr(bird, bird - noisy_signal_compensated);
SNR_denoised = snr(bird, bird - denoised_signal_compensated);

t = (0:length(bird)-1)/fs;

figure;
subplot(3,1,1);
plot(t, bird);
title('Clear Sound');

subplot(3,1,2);
plot(t, noisy_signal_compensated);
title('Noisy Sound');

subplot(3,1,3);
plot(t, denoised_signal_compensated);
title('Denoised Sound');

%Frequency spectrum
n = length(bird);
Y_clear = fft(bird);
Y_noisy = fft(noisy_signal_compensated);
Y_denoised = fft(denoised_signal_compensated);
f = (0:n-1)*(fs/n);


figure;
plot(f, abs(Y_clear), 'b', 'LineWidth', 3);
hold on;
plot(f, abs(Y_noisy), 'r', 'LineWidth', 1.5);
plot(f, abs(Y_denoised), 'g', 'LineWidth', 1.5);
title('Frequency Spectrum Comparison');
legend('Clear Sound', 'Noisy Sound', 'Denoised Sound');


fprintf('SNR for Noisy Sound: %.2f dB\n', SNR_noisy);
fprintf('SNR for Denoised Sound: %.2f dB\n', SNR_denoised);


sound(bird, fs);
pause(length(bird)/fs + 1);
sound(noisy_signal_compensated, fs);
pause(length(noisy_signal_compensated)/fs + 1);
sound(denoised_signal_compensated, fs);
