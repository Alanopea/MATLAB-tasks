clc; clear all; close all;
[x, fs] = audioread('music44100Hz.mp3');

fsup = 48000; 
K = 160; 
L = 147; 

xup = resample(x, K, L);

soundsc(xup,48000);