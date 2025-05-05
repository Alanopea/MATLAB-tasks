% dsp01_ex_sine.m
clc; clear all; close all;

fs=8000; Nx=10*fs; df =2000;     % sampling frequency, number of samples

dt = 1/fs;                      % sampling period

t = dt*(0:Nx-1);                % sampling times (many moments)

A1=0.5; f1=1; p1=pi/4;          % sine: amplitude, frequency and phase

x=exp(j*2*pi*(0*t+0.5*df*t.^2));    % sine as a first signal component


%sound(x,fs);

    figure(2);
        spectrogram (x,256,256-64,512,fs)