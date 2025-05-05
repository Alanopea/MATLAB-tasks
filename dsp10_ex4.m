clc; clear all; close all;

[music, fs48k] = audioread('music48k.mp3');
[speech8k, fs8k] = audioread('speech8k.wav');


music = music(:, 1)' * 0.5;
speech8k = speech8k(:, 1)';


L = 6; 
N = 2 * 50 + 1; 
h = fir1(N-1, 1/L - 0.1*(1/L), kaiser(N, 12)); 


y = filter(h, 1, music);
ydown = y(1:L:end); 


Nx = length(music);
R = rem(Nx, L);
music = music(1:end-R);
Nx = Nx - R;


x = [zeros(1, L-1), music(1:end-(L-1))];
ydpp = zeros(1, Nx/L);

for k = 1:L
    ydpp = ydpp + filter(h(k:L:end), 1, x(L-k+1:L:end));
end

Ny = min(length(speech8k), length(ydown)); 
speech8k = speech8k(1:Ny);
ydown = ydown(1:Ny);

music = music(1:length(speech8k)); 
og = music + speech8k;

down = ydown + speech8k;

soundsc(og, fs8k);
pause(length(og) / fs8k + 2);
soundsc(down, fs8k);
