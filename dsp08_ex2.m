%dsp8_ex_iir_intro.m
clear all; close all;
fs = 2000;
gain = 0.001;
z = [1] .* exp(j*2*pi* 300/fs); z = [z conj(z)];
p = [0.999] .* exp(j*2*pi* 400/fs); p = [p conj(p)];
b = gain*poly(z), a = poly(p), pause 

figure;
v=0:pi/1000:2*pi; c=cos(v); s=sin(v);
plot(real(z),imag(z),'bo', real(p),imag(p),'r*',c,s,'k-'); grid;
title('Zeros and Poles'); xlabel('Real()'); ylabel('Imag()'); pause
% Verification of filter responses: amplitude, phase, impulse, step
f = 0 : 0.1 : 1000; % frequency in hertz
om = 2*pi*f/fs; % normalized pulsation, radial frequency
zz = exp(-j*om); % Z transform variable z^(-1)
H = polyval(b(end:-1:1),zz) ./ polyval( a(end:-1:1),zz); % ratio of two polynomials
% H = freqz(b,a,f,fs) % all-in-one Matlab function
figure; plot(f,20*log10(abs(H))); xlabel('f [Hz]'); title('|H(f)| [dB]'); grid; pause
figure; plot(f,unwrap(angle(H))); xlabel('f [Hz]'); title('angle(H(f)) [rad]'); grid; pause

