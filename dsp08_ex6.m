clc; clear all; close all;

[piano, fs] = audioread('toypiano.mp3');

t = (0:length(piano)-1) / fs; 
dist = sin(2*pi*1500*t) * 100; 
disturbed = piano + dist';
 

% Compute the frequency axis for the Fourier transform
f_axis = (0:length(piano)-1) * fs / length(piano);

Rp = 3; Rs = 80; f = 1400; 
[b, a] = ellip(10, Rp, Rs, f/(fs/2), 'low');

filtered = filter(b, a, disturbed);

sound(disturbed, fs);
pause
sound(filtered, fs);


