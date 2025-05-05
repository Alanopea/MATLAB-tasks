% dsp01_ex_audio.m
clc; clear all; close all;

% Audio signal acquisition
fs = 8000;      % sampling frequency (samples per second):
                % 8000, 11025, 16000, 22050, 32000, 44100, 48000, 96000,
bits = 8;       % number of bits per sample: 8, 16, 24, 32
channels = 1;   % number of channels: 1 or 2 (mono/stereo)
recording = audiorecorder(fs, bits, channels); % create recording object
disp('Press any key and to record audio'); pause;
record(recording);  % start recording
pause(2);           % record for two seconds
stop(recording);    % stop recording
play(recording);    % listen
audio = getaudiodata( recording, 'single' ); % import data from the audio object

% Verification - listening, plotting
sound(audio,fs);            % play a recorded sound
x = audio; clear audio;     % copy audio, clear audio
Nx = length(x);             % get number of samples,
n= 0:Nx-1;                  % indexes of samples
dt = 1/fs;                  % calculate sampling period
t = dt*n;                   % calculate time stamps
figure; plot(x,'bo-'); xlabel('sample number n'); title('x(n)'); grid;
figure; plot(t,x,'b-'); xlabel('t (s)'); title('x(t)'); grid;

% Write to disc and read from disc
audiowrite('speech.wav',x,fs,'BitsPerSample',bits); % write the recording
[y,fs] = audioread('speech.wav');                   % read it from file
sound(y,fs);                                        % play it again