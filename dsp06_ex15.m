% Step 1: Read the audio file
filename = 'heartbeat.mp3';
[y, fs] = audioread(filename);


% Step 3: Apply FFT to obtain frequency spectrum
n = length(y); % Length of audio signal
Y = fft(y); % Compute FFT
frequencies = (0:n-1)*(fs/n); % Frequency axis

% Plot FFT spectrum
figure;
plot(frequencies, abs(Y));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT Spectrum of Audio Signal');

sound(y, fs);

% Example:
 [correlation, lags] = xcorr(y);


 plot(lags, correlation);
 xlabel('Lag');
 ylabel('Correlation');
 title('Cross-correlation for Heartbeat Periodicity Estimation'); grid on;