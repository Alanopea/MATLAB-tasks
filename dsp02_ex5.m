% dsp01_ex_sine.m
clc; clear all; close all;

fs=8000; Nx=3*fs; df =2000;     % sampling frequency, number of samples

dt = 1/fs;                      % sampling period

t = dt*(0:Nx-1);                % sampling times (many moments)

A1=1; f1=100; p1=pi;          % sine: amplitude, frequency and phase

x1 = A1 * sin(2*pi*f1*t+p1);   % sine as a first signal component
 x2 = 10 * sin(2*pi*5*t+p1);
  x3 = 3 * sin(2*pi*1000*t+p1);

x=x1+x2+x3;

    figure(1);
        plot(t,x,'o-'); grid; title('Signal x(t)'); xlabel('time [s]'); ylabel('Amplitude');

%sound(x,fs);

x=x.*exp(-t);

    figure(2);
        plot(t,x,'o-'); grid; title('Signal x(t) multiplied with exponent'); xlabel('time [s]'); ylabel('Amplitude');

%sound(x,fs);

x=x.*exp(-(t-1.5).^2);

    figure(3);
        plot(t,x,'o-'); grid; title('Signal x(t) multiplied with Gaussian'); xlabel('time [s]'); ylabel('Amplitude');

%sound(x,fs);


