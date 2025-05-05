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

maryhadalittlelamb = [x3,x2,x1,x2,x3,x3,x3,x2,x2,x2,x3,x3,x3,x3,x2,x1,x2,x3,x3,x3,x2,x2,x3,x2,x1];


% Compute the spectrogram
window_length = 512; % Adjust the window length as needed
window_shift = 256; % Adjust the window shift as needed
nfft = 1024; % Adjust the FFT length as needed
[s, f, t] = spectrogram(maryhadalittlelamb, hamming(window_length), window_shift, nfft, fs);

% Plot the spectrogram
figure;
imagesc(t, f, 10*log10(abs(s)));
axis xy;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram of "Mary Had a Little Lamb"');
colorbar;

% Play the audio
sound(maryhadalittlelamb, fs);