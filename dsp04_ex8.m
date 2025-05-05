clc; clear; close all;
% Define parameters
N = 2000;       % Number of samples
fs = 2000;      % Sampling frequency
dt = 1/fs;      % Time step
t = dt * (0:N-1);  % Time vector

% Generate sign signal x(t)
xt = sign(t);

w = fft(xt);
Xw = 2 ./ (j * w);

figure;
    subplot(2, 1, 1);
        plot(t, xt);
        xlabel('Time (s)');
        ylabel('Amplitude');
        title('Sign Signal: x(t)');
     subplot(2, 1, 2);
        plot(w, abs(Xw));
        xlabel('Frequency (rad/s)');
        ylabel('|X(\omega)|');
        title('Frequency-domain Representation: |X(\omega)|');
