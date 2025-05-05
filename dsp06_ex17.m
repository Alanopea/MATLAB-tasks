fs = 44100;
% Step 1: Read the recorded impulse response
[h] = audioread('hall.wav');

% Step 2: Read the music signal
[x] = audioread('rari.mp3');

% Step 3: Perform fast convolution
% Ensure both signals have the same orientation (vertical or horizontal)
% and the same length
%if size(x, 2) ~= size(h, 2)
    %error('Number of channels in x and h must match.');
%end

% Make both signals the same length
max_length = max(length(x), length(h));
x = [x; zeros(max_length - length(x), size(x, 2))];
h = [h; zeros(max_length - length(h), size(h, 2))];

% Perform FFT-based convolution
y = ifft(fft(h) .* fft(x));

% Step 4: Listen to the original music and the processed one
sound(x, fs); % Original music
pause
sound(real(y), fs); % Processed music