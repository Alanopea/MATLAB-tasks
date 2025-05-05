  % dsp01_ex_noise.m
clc; clear all; close all;

fs=8000; Nx=3*fs;
dt = 1/fs;
t = dt*(0:Nx-1); 

s1 = rand(1,Nx);  s1 = 0.1*(2*(s1-0.5));    % uniform; scaling to [-0.1,0.1]
 s2 = randn(1,Nx);  s2 = 0.1*s2;            % Gaussian; scaling to std=0.1

s = randn(1,Nx);

x1 = sin(2*pi*100*t+pi);

x=x1+s;

    figure
        subplot(221); plot(s1,'.-'); grid; title('Uniform [0,1] noise');
         subplot(222); plot(s2, '.-'); grid; title('Gaussian noise');
          subplot(223); hist(s1,20); title( 'Histogram of uniform noise' );
           subplot(224); hist(s2,20); title( 'Histogram of Gaussian noise' ); 
    
    figure(2)
        plot(t,x1,'o-'); grid; title('Signal y(t)'); xlabel('time [s]'); ylabel('Amplitude');


    figure(3)
        subplot(3,1,1); hist(x1,20); title( 'Histogram of sine' );
        subplot(3,1,2); hist(s,20); title( 'Histogram of Gaussian noise' );
        subplot(3,1,3); hist(x,20); title( 'Histogram of sine with Gaussian noise' );
sound(x,fs);
%sound(x1,fs);