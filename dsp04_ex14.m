clc; clear all; close all;

x = audioread('bird song.wav');
Fs = 11025;

t = (0:length(x)-1) / Fs;
figure (1)
    subplot(2, 1, 1); plot(t, x);
        title('Original Signal');
    X = fft(x);
    N = length(X);
    frequencies1 = (0:N-1) * Fs / N;
    subplot(2, 1, 2); plot(frequencies1, X);
        title('DFT of Original Signal');

% Scaling
xs = 5*x;
% Convolution
y = fir1(25, 0.25);
xc = conv(xs, y, 'same');
% Derivative operation
xd = diff(xc) * Fs;

XD = fft(xd);
N = length(XD);
frequencies2 = (0:N-1) * Fs / N;

figure;
subplot(2,1,1); plot(t(1:end-1),xd,'m',t,x,'b');
legend('Derivative','Original');
subplot(2,1,2); plot (frequencies2,XD,'m',frequencies1,X,'b');
legend('Derivative','Original');
title('Comparison of Signals'); 


sound(x, Fs); 
pause;
sound(xs, Fs); 
pause;
sound(xc, Fs);
pause;
sound(xd, Fs);