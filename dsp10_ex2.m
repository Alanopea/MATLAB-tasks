clc; clear all; close all;
[music, fs48k] = audioread('music48k.mp3');
[speech8k, fs8k] = audioread('speech8k.wav');

music = music * 0.3;

music = music(:,1)';
speech8k = speech8k(:,1)';

Nx = length(speech8k);
Nm = length(music);

K = 6;
R = rem(Nx,K);
speech48k = speech8k(1:end-R);
Nx = Nx - R;

xz = zeros(1, K * Nx); % Array of zeros
xz(1:K:end) = speech48k; % Copying signal samples
N = 2 * 60 + 1; % Filter length
h = K * fir1(N-1, 1/K, kaiser(N, 12)); % Interpolation filter design
speech48k = filter(h, 1, xz); % Signal filtering

Ny = length(speech48k);

music = music(1:Ny);
up = music + speech48k;


music = music(1:Nx);


og = music + speech8k;


soundsc(og, fs48k);
pause(length(og) / 48000);
soundsc(up, fs48k);