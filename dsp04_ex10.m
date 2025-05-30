clc; clear all; close all;

N = 100;                            % number of samples: 100 --> 1000
fs = 1000; dt=1/fs; t=dt*(0:N-1);   % sampling ratio
df = 10;                            % sampling step in DtFT: 10 --> 1
fmax = 2.5*fs;                      % sampling range in DtFT: 2.5 --> 0.5
fx1 = 100;                          % frequency of signal component 1
fx2 = 250; Ax2 =0.001;              % frequency and amplitude of signal component 2
                                    % 250 --> 110, 0.001 --> 0.00001


                                    
% Signal
x1 = cos(2*pi*fx1*t);           % first component
x2 = Ax2*cos(2*pi*fx2*t);       % 250Hz --> 110Hz, 0.001 --> 0.00001
x = x1;                         % + x2; % x1, x1+x2, 20*log10(0.00001)=-100 dB
stem(x); title('x(n)'); pause   % analyzed signal

% Windowing
w1 = boxcar(N)';                % rectangular window
w2 = hanning(N)';               % Hanning window
w3 = chebwin(N,140)';           % Chebyshev window, 80, 100, 120, 140
w = w1;                         % w1 --> w2, w3 (80, 100, 120, 140)
stem(w); title('w(n)'); pause   % window
x = x .* w;                     % x = x, w, x.*w
stem(x); title('xw(n)'); pause  % windowed signal

% DFT - later in this chapter (red circles)
% k=0:N-1; n=0:N-1; F = exp(-j*2*pi*(k’*n)); X = (1/N)*F*x;
f0 = fs/N; f1 = f0*(0:N-1);     % DFT freq step = f0 = 1/(N*dt)
for k = 1:N
    X1(k) = sum( x .* exp(-j*2*pi/N* (k-1) *(0:N-1) ) )/ N;
   %X1(k) = sum( x .* exp(-j*2*pi/N* (f1(k)/fs) *(0:N-1) ) )/ N;
end
%X1 = N*X1/sum(w);              % scaling for any window

% DtFT - already discussed (blue line)
f2 = -fmax : df : fmax;         % df = 10 --> 1; first this freq. range
for k = 1 : length(f2)
    X2(k) = sum( x .* exp(-j*2*pi* (f2(k)/fs) *( 0:N-1) ) ) / N;
end
%X2 = N*X2/sum(w);              % scaling for any window

% Figures
figure; plot(f1,abs(X1),'ro',f2,abs(X2),'b-');
    xlabel('f (Hz)'); grid; pause
figure; plot(f1,20*log10(abs(X1)),'ro',f2,20*log10(abs(X2)),'b-');
    xlabel('f (Hz)'); grid; pause