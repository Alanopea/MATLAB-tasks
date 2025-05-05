% dsp01_ex_sine.m
clc; clear all; close all;

fs=100; Nx=100;                 % sampling frequency, number of samples

dt = 1/fs;                      % sampling period

t = dt*(0:Nx-1);                % sampling times (many moments)

A1=0.5; f1=1; p1=pi/4;          % sine: amplitude, frequency and phase
f2=fs+f1; f3=2*fs+f1;

%01

x1 = A1 * sin(2*pi*f1*t+p1);    % sine as a first signal component
 x2 = A1 * sin(2*pi*f2*t+p1); 
  x3 = A1 * sin(2*pi*f3*t+p1); 

    figure(1);
        subplot(3,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude');

%02
    
f1=1; f2=fs-f1; f3=2*fs-f1;

x1 = A1 * sin(2*pi*f1*t+p1);    
 x2 = A1 * sin(2*pi*f2*t+p1); 
  x3 = A1 * sin(2*pi*f3*t+p1);

     figure(2);
        subplot(3,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude');

%03

f1 = 5; f2=fs+f1; f3=2*fs+f1;

x1 = A1 * sin(2*pi*f1*t+p1);    
 x2 = A1 * sin(2*pi*f2*t+p1); 
  x3 = A1 * sin(2*pi*f3*t+p1);
     
    figure(3);
        subplot(3,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude');      
            
%04

f1 = 5; f2=fs-f1; f3=2*fs-f1;

x1 = A1 * sin(2*pi*f1*t+p1);    
 x2 = A1 * sin(2*pi*f2*t+p1); 
  x3 = A1 * sin(2*pi*f3*t+p1);
     
    figure(4);
        subplot(3,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude');

%05

f1 = 5; f2=fs+f1; f3=2*fs+f1;

x1 = A1 * cos(2*pi*f1*t+p1);    
 x2 = A1 * cos(2*pi*f2*t+p1); 
  x3 = A1 * cos(2*pi*f3*t+p1);
     
    figure(5);
        subplot(3,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude'); 

%06

f1 = 5; f2=fs-f1; f3=2*fs-f1;

x1 = A1 * cos(2*pi*f1*t+p1);    
 x2 = A1 * cos(2*pi*f2*t+p1); 
  x3 = A1 * cos(2*pi*f3*t+p1);
     
    figure(6);
        subplot(3,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude');

%07

fs=8000; Nx=3*fs;

dt = 1/fs;

t = dt*(0:Nx-1);

f1=200; f2=fs+f1; f3=2*fs+f1;

x1 = A1 * cos(2*pi*f1*t+p1);    
 x2 = A1 * cos(2*pi*f2*t+p1); 
  x3 = A1 * cos(2*pi*f3*t+p1);

  figure(7);
        subplot(3,1,1);
            plot(t,x1,'r.-'); grid; title('Signal x1(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);
            plot(t,x2,'g.-'); grid; title('Signal x2(t)'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);
            plot(t,x3,'b.-'); grid; title('Signal x3(t)'); xlabel('time [s]'); ylabel('Amplitude');

sound(x1,fs);
pause
sound(x2,fs);
pause
sound(x3,fs);
