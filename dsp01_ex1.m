% dsp01_ex_sine.m
clc; clear all; close all;

fs=8000; Nx=3*fs;               % sampling frequency, number of samples

dt = 1/fs;                      % sampling period

t = dt*(0:Nx-1);                %sampling times (many moments)

A1=1; f1=200; p1=2*pi; fy=1;      % sine: amplitude, frequency and phase

y1 = A1 * sin(2*pi*fy*t+p1);    % sine as a first signal component
 y2 = A1 * sin(2*pi*2*fy*t+p1);

x1 = (4+A1) * sin(2*pi*(f1+30)*t+p1/5);
 x2 = (A1-0.5) * sin(2*pi*(f1-100)*t+p1/3);
  x3 = (15+A1) * sin(2*pi*(50+f1)*t+p1/2);
   x = x1 + x2 + x3;


    figure(1);
        subplot(2,1,1);
            plot(t,y1,'o-'); grid; title('Signal y(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(2,1,2);
            plot(t,y2,'o-'); grid; title('Signal y(t) with changed phase'); xlabel('time [s]'); ylabel('Amplitude');
    
    
    figure(2);
        subplot(4,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(4,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(4,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(4,1,4);
            plot(t,x,'k.-'); grid; title('Signals added together'); xlabel('time [s]'); ylabel('Amplitude');

sound(x,fs);

