% dsp01_ex_sine.m
clc; clear all; close all;

fs=8000; Nx=5*fs; df =2000;     % sampling frequency, number of samples

dt = 1/fs;                      % sampling period

t = dt*(0:Nx-1);                % sampling times (many moments)

A1=0.5; f1=1; p1=pi/4;          % sine: amplitude, frequency and phase

x1 = sin(2*pi*1*t);
x2 = 2*(1+0.25*0.5).*sin(2*pi*5*t);   % sine as a first signal component
x3 = 2*sin(2*pi*(5*t+5*cumsum(x2)*dt));

x = x2 .* x3;

    figure(1);
        plot(t,x,'o-'); grid; title('Signal x(t)'); xlabel('time [s]'); ylabel('Amplitude');

sound(x,fs);
