% Load the audio signals (replace 'signal1.wav', 'signal2.wav', etc., with your file names)
[y1, Fs1] = audioread('Cuckoo.wav');
[y2, Fs2] = audioread('LAUGH.wav');
% Load additional signals if needed

% Time vectors
t1 = (0:length(y1)-1) / Fs1;
t2 = (0:length(y2)-1) / Fs2;
% Time vectors for additional signals

% Parameters
N1 = length(y1); % Length of signal 1
N2 = length(y2); % Length of signal 2
fs1 = Fs1; % Sampling frequency of signal 1
fs2 = Fs2; % Sampling frequency of signal 2
fmax = 5000; % Maximum frequency for DTFT
df = 10; % Frequency resolution for DTFT

% Initialize array to store DFT results
X1_DFT = [];

% Compute the Discrete Fourier Transform (DFT) for signal 1
f0_1 = fs1/N1; 
f1_1 = f0_1*(0:N1-1);
for k = 1:N1
    X1_DFT_k = sum(y1 .* exp(-1i*2*pi/N1* (k-1) *(0:N1-1) ) )/ N1;
    X1_DFT = [X1_DFT, X1_DFT_k]; % Concatenate computed DFT value
end

% Compute the Discrete Fourier Transform (DFT) for signal 2
f0_2 = fs2/N2; 
f1_2 = f0_2*(0:N2-1);
for k = 1:N2
    X2_DFT(k) = sum(y2 .* exp(-1i*2*pi/N2* (k-1) *(0:N2-1) ) )/ N2;
end

% Compute the Discrete-Time Fourier Transform (DTFT) for signal 1
f2_1 = -fmax : df : fmax;
X1_DTFT = zeros(1, length(f2_1));
for k = 1 : length(f2_1)
    X1_DTFT(k) = sum(y1 .* exp(-1i*2*pi* (f2_1(k)/fs1) *( 0:N1-1) ) ) / N1;
end

% Compute the Discrete-Time Fourier Transform (DTFT) for signal 2
f2_2 = -fmax : df : fmax;
X2_DTFT = zeros(1, length(f2_2));
for k = 1 : length(f2_2)
    X2_DTFT(k) = sum(y2 .* exp(-1i*2*pi* (f2_2(k)/fs2) *( 0:N2-1) ) ) / N2;
end

% Plot signals and their spectra
figure;
subplot(2, 1, 1);
plot(t1, y1, 'b', t2, y2, 'r');
xlabel('Time (s)');
ylabel('Amplitude');
title('Signals');
legend('Signal 1', 'Signal 2');
grid on;

subplot(2, 1, 2);
plot(f1_1, abs(X1_DFT), 'b', f2_1, abs(X1_DTFT), 'r');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectra (Signal 1)');
legend('DFT', 'DTFT');
grid on;

figure;
plot(f1_2, abs(X2_DFT), 'b', f2_2, abs(X2_DTFT), 'r');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Spectra (Signal 2)');
legend('DFT', 'DTFT');
grid on;