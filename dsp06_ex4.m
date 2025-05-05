clc; clear; close all;

Fs = 1000;          
f1 = 10;            
A1 = 1;
G = 10;
T = 5;             
dt = 1/Fs; 
t = dt * (0:T/dt - 1);
fragments = 10;

sig1 = A1 * sin(2*pi*f1*t);

% Gaussian noise
Gauss = G * randn(size(t)); 
sig2 = sig1 + Gauss;

% FFT
Mfft = length(sig2); 
X = fft(sig2, Mfft);     
X2 = abs(X(1:Mfft/2+1)/Mfft).^2;
X2scaled = 2 * X2 * T / A1^2;

f = Fs*(0:(Mfft/2))/Mfft;  % Frequency vector

spectra = zeros(fragments, length(X2scaled));  % Initialize spectra matrix

for i = 1:fragments
    fs = round((i - 1) * length(t) / fragments) + 1;
    fe = round(i * length(t) / fragments);
    noise = Gauss(fs:fe);
    sig3 = sig1(fs:fe) + noise;
    
    Xf = fft(sig3);
    X2f = abs(Xf(1:length(Xf)/2 + 1)).^2 / (length(sig3));
    X2fp = [X2f, zeros(1, length(X2scaled) - length(X2f))];
    spectra(i, :) = X2fp;
end

means = mean(spectra, 1);  % Calculate mean spectrum of fragments

figure(1)
subplot(2,1,1);  
plot(t, sig1, 'b', t, sig2, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Noisy Signal');
title('Original and Noisy Signals');

subplot(2,1,2); 
plot(f, X2scaled, 'b');
xlabel('Frequency (Hz)');
ylabel('Power (V^2/Hz)');
title('Power Spectrum of Noisy Signal');

figure(2)
frequencies = linspace(0, Fs/2, length(means));
plot(frequencies, means);
xlabel('Frequency (Hz)');
ylabel('Power (V^2/Hz)');
title('Mean Spectrum of 10 Signal Fragments');