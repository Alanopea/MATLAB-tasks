clear; close all;

Nx=1000; fs=2000; f0=fs/40; x = cos(2 * pi * (f0 / fs) * (0:Nx-1));
xa1 = hilbert(x);

M=50; N=2*M+1; n=-M:M; h=(1-cos(pi*n))./(pi*n); h(M+1)=0;
stem(n,h); title('h(n)'); xlabel('n'); grid; 

f=-fs/2 : fs/2000 : fs/2;
H1 = polyval( h(end:-1:1), exp(-j*2*pi*f/fs) );
H2 = freqz(h,1,f,fs);
figure(2); plot( f, 20*log10(abs(H1)) ); grid; xlabel('f [Hz]');
figure(3); plot( f, unwrap(angle(H1)) ); grid; xlabel('f [Hz]');

w = kaiser(N, 10)';
h = h .* w;

H1 = polyval(h(end:-1:1), exp(-1i * 2 * pi * f / fs));
H2 = freqz(h, 1, f, fs);


figure(4); plot( f, 20*log10(abs(H1)) ); grid; xlabel('f [Hz]');
ylabel('|H(f)| [dB]');
title('Amplitude-Frequency Response');


figure(5);
plot(f,angle(exp(j*2*pi*f/fs*M).*H1)); grid; xlabel('f [Hz]');
title('Phase-Frequency Response');


xH = filter(h,1,x);


x = x(M+1 : Nx-M); % synchro of filter input (2M+1 filter weights)
xH = xH(2*M+1 : Nx); % synchro of filter output (2M+1 filter weights)
xa = x + j*xH; Nx = length(xa); % analytic signal creation

figure(6); plot (1:Nx,x,'ro-',1:Nx,xH,'bo-')
figure(7); plot (x,xH,'bo-')

X=fft(x);
xa1=fft(xa);

figure(8);
subplot(2,1,1);
plot(abs(X));
title('FFT of Original Signal');
grid on;

subplot(2,1,2);
plot(abs(xa1));
title('FFT of Analytic Signal');
grid on;


