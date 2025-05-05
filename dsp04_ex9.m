clc; clear; close all;

N = 2000;       
fs = 2000;      
dt = 1/fs;      
t = dt * (0:N-1);

x = sin(2*pi*50*t);
y = kaiser(N,15);

X = fft(x);
Y = fft(y);

figure
    subplot (2,1,1); plot(t,X);
    subplot (2,1,2); plot(t,Y); 

% Linearity
l = (3*x) + (2*y);
L = fft(l);
CheckL = (3*X) + (2*Y);

figure
    subplot (2,1,1); plot(t,L);
    subplot (2,1,2); plot(t,CheckL);

% Scaling
x = sin(2*pi*50*(t*50));
X = fft(x);
CheckX = (1/50)*X;

figure
    subplot (2,2,1); plot (t,X);
    subplot (2,2,2); plot (t,CheckX);
    






