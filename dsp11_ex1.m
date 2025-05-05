clear; close all;

Nx=1000; fs=2000; f0=fs/40; x = cos(2 * pi * (f0 / fs) * (0:Nx-1));
xa1 = hilbert(x);


X = fft(x);

X=fft(x);
n=1:Nx/2; X(n)=-j*X(n); % positive frequencies
X(1)=0; X(Nx/2+1)=0;
n=Nx/2+2:Nx; X(n)= j*X(n); % negative frequencies
xH=real(ifft(X));
xa2=x+j*xH; % analytic signal


% Plotting the original signal and its Hilbert transform
figure(1); plot(0:Nx-1, x, 'b', 0:Nx-1, xH, 'r'); 
title('Original Signal and Hilbert Transform');
grid on;

figure(2); plot(x,xH,'bo-')

figure; 
for n=1:100 
    
    plot(x(n),xH(n),'bo'); hold on; pause(0.05); 
end

X = fft(x)
xa=xa2;
Xa = fft(xa)

% Display FFTs
figure;
subplot(2,1,1);
plot(abs(X));
title('FFT of Original Signal');
grid on;

subplot(2,1,2);
plot(abs(Xa));
title('FFT of Analytic Signal');
grid on;


[speech, fs_speech] = audioread('speech8000.wav');
Nx_speech = length(speech);


xa1_speech = hilbert(speech);
X_speech = fft(speech);
Xa_speech = fft(xa1_speech);


figure;
subplot(2,1,1); plot(abs(X_speech));
title('FFT of Original Speech Signal');
grid on;

subplot(2,1,2); plot(abs(Xa_speech));
title('FFT of Analytic Speech Signal');
grid on;

