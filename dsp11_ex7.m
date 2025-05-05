% dsp11_ex_diff_FMdemod.m
clear all; close all;

fc = 20000;                  % Carrier frequency (Hz)
M = 200; N = 2*M+1;          % N = 2M+1 = length FIR filters (to be designed)
fmax = 17500;                % Maximum signal frequency of music (Hz)
DF = 5000;                   % 2*DF = required bandwidth of FM modulated signal (Hz)
kf = (DF/fmax-1)*fmax;       % Modulation index from Carson's rule
n = -M:M;

[x, fx] = audioread('speech44100.wav', [1, 1*44100]); % Samples from-to
soundsc(x, fx);                  % Listen to music
x = x';                          % Transpose the signal for processing
x = resample(x, 96000, 44100);   % Up-sample the signal from 44.1 kHz to 96 kHz
fs = 96000;                      % New sampling frequency
Nx = length(x);                  % Number of samples
dt = 1 / fs;                     % Time interval between samples
t = dt * (0:Nx-1);               % Time vector
figure(1);
subplot(211); plot(t, x); grid; xlabel('t (s)'); title('x(t)');
subplot(212); spectrogram(x, 256, 192, 512, fs, 'yaxis'); title('STFT(1)'); pause

%FM modulation
y = cos(2 * pi * (fc * t + kf * cumsum(x) * dt));
figure(2); spectrogram(y, 256, 192, 512, fs, 'yaxis'); title('STFT(2)'); pause


%original
hD1 = cos(pi * n) ./ n; 
hD1(M+1) = 0; 
w1 = kaiser(2 * M + 1, 10)'; 
hD1 = hD1 .* w1;

%hamming
hD2 = cos(pi * n) ./ n;
hD2(M+1) = 0;
w2 = hamming(2 * M + 1)'; 
hD2 = hD2 .* w2;

%longer kaiser(M=300)
M3 = 300; N3 = 2*M3+1;
n3 = -M3:M3;
hD3 = cos(pi * n3) ./ n3; 
hD3(M3+1) = 0;
w3 = kaiser(2 * M3 + 1, 10)'; 
hD3 = hD3 .* w3;



hD = hD1; %original
%hD = hD2; %hamming
%hD = hD3; %longer kaiser(M=300)



y = filter(hD, 1, y); y = y(N:end);     
figure(3); spectrogram(y, 256, 192, 512, fs, 'yaxis'); title('STFT(3)'); pause

%power of two
y = y .^ 2;
figure(4); spectrogram(y, 256, 192, 512, fs, 'yaxis'); title('STFT(4)'); pause

%lowpass filtering
n = -M:M; 
hLP = sin(2 * pi * (fmax + 3000) / fs * n) ./ (pi * n);
hLP(M+1) = 2 * (fmax + 3000) / fs; 
hLP = hLP .* w1;
y = filter(hLP, 1, y); 
y = y(N:end);
figure(5); spectrogram(y, 256, 192, 512, fs, 'yaxis'); title('STFT(5)'); pause

%multiplying by 2 and square root
y = real(sqrt(2 * y));
figure(6); spectrogram(y, 256, 192, 512, fs, 'yaxis'); title('STFT(6)'); pause

%final scaling
y = (y - 2 * pi * fc / fs) / (2 * pi * kf / fs);
figure(7); spectrogram(y, 256, 192, 512, fs, 'yaxis'); title('STFT(7)'); pause

%result
t = t(2 * N - 1:Nx); 
figure(8);
subplot(211); plot(t, y); grid; xlabel('t (s)'); title('y(n)');
subplot(212); spectrogram(y, 256, 192, 512, fs, 'yaxis'); title('STFT(8)'); pause
x = resample(y, 44100, 96000);
soundsc(x, fx); pause