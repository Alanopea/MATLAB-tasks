% dsp02_ex_deterministic.m
clc; clear all; close all;

fs=100; Nx=100;                 % sampling frequency, number of samples
dt = 1/fs;                      % sampling period

t = dt*(0:Nx-1);                % sampling times (many moments)

x1=sin(2*pi*10*t+pi/4);         % sine 10 Hz as a first signal component
x2=sin(2*pi*1*t);               % sine 1 Hz
x3=exp(-5*t);                   % exponent decaying in time
x4=exp(-25*(t-0.5).^2);         % Gaussian hat
x5=sin(2*pi*(0*t+0.5*20*t.^2)); % linear frequency increase: start 0 Hz, +20Hz/s
x6=sin(2*pi*(10*t-(9/(2*pi*1)*cos(2*pi*1*t)))); % sinus. FM: 9Hz around 10Hz, 1 per sec
x7=sin(2*pi*(10*t+9*cumsum(x2)*dt));            % the same as x6; why?

x = 0.25*x1+2*x2;                         % our choice: x1,x2,...,x7, 0.23*x1 + x2, x1.*x3, ...
y = (1+0.5*x2).*x1;
z = x2.*x1;
c = x3.*x1;
v = x4.*x1;
b = (1+0.5*x2).*x5;
n = (1+0.5*x2).*x6;


    figure(1);
        subplot(4,1,1);plot(t,x,'o-'); grid; title('Signal x(t)=0.25*x1+2*x2'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(4,1,2);plot(t,y,'o-'); grid; title('Signal x(t)=(1+0.5*x2).*x1'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(4,1,3);plot(t,z,'o-'); grid; title('Signal x(t)=x2.*x1'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(4,1,4);plot(t,c,'o-'); grid; title('Signal x(t)=x3.*x1'); xlabel('time [s]'); ylabel('Amplitude');
       
    
    
    figure(2);
        subplot(3,1,1);plot(t,v,'o-'); grid; title('Signal x(t)=x4.*x1;'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,2);plot(t,b,'o-'); grid; title('Signal x(t)=(1+0.5*x2).*x5'); xlabel('time [s]'); ylabel('Amplitude');
        subplot(3,1,3);plot(t,n,'o-'); grid; title('Signal x(t)=(1+0.5*x2).*x6'); xlabel('time [s]'); ylabel('Amplitude');








