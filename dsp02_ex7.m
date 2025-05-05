clc; clear all; close all;

fs = 8000; Nx = fs/2; 

f0 = 27.5;
octave = 4;

C4 = f0 * 2^octave * 2^(4/12);
D4 = f0 * 2^octave * 2^(6/12);
E4 = f0 * 2^octave * 2^(8/12);


dt = 1/fs; 
t = dt * (0:Nx-1); 
    
x1 = sin(2*pi*C4*t + pi); 
x2 = sin(2*pi*D4*t + pi); 
x3 = sin(2*pi*E4*t + pi);

merryhadalittlelamb = [x3,x2,x1,x2,x3,x3,x3,x2,x2,x2,x3,x3,x3,x3,x2,x1,x2,x3,x3,x3,x2,x2,x3,x2,x1];

sound(merryhadalittlelamb, fs);


