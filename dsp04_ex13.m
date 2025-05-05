% Step 1: Download the audio files
% Assuming you've already downloaded the audio files and named them
% "car_engine.wav" and "bird_song.wav".

% Step 2: Load the audio files
car_engine_audio = audioread('car engine.wav');
bird_song_audio = audioread('bird song.wav');

% Step 3: Calculate and plot the DFT spectra
fs = 11025; % Sampling frequency (assuming both audio files have the same sampling frequency)
N_car = length(car_engine_audio);
N_bird = length(bird_song_audio);

% Calculate DFT spectra
car_engine_spectrum = abs(fft(car_engine_audio));
bird_song_spectrum = abs(fft(bird_song_audio));

% Plot DFT spectra
frequencies_car = linspace(0, fs/2, N_car/2);
frequencies_bird = linspace(0, fs/2, N_bird/2);
figure;
subplot(2,1,1);
plot(frequencies_car, car_engine_spectrum(1:N_car/2));
title('Car Engine DFT Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
subplot(2,1,2);
plot(frequencies_bird, bird_song_spectrum(1:N_bird/2));
title('Bird Song DFT Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Step 5: Calculate and plot the DFT spectrum of the combined signal
combined_length = max(N_car, N_bird);
car_engine_spectrum_padded = [car_engine_spectrum; zeros(combined_length - N_car, 1)];
bird_song_spectrum_padded = [bird_song_spectrum; zeros(combined_length - N_bird, 1)];
combined_spectrum = car_engine_spectrum_padded + bird_song_spectrum_padded;

% Step 6: Zero out DFT coefficients belonging mostly to one signal
% For demonstration purposes, let's zero out DFT coefficients of car engine
threshold = 0.05 * max(combined_spectrum); % Adjust threshold as needed
combined_spectrum(car_engine_spectrum > threshold) = 0;

% Step 7: Perform IDFT to obtain the filtered signal
filtered_signal = ifft(combined_spectrum, 'symmetric');

% Step 8: Listen to the filtered signal
sound(filtered_signal, fs);