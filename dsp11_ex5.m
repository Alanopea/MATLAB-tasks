clear all, close all

[x0, fs2] = audioread("pulp8k.mp3");
x1 = x0(1:end/2); x2 = x0(end/2+1:end);
%x1 = sin(2 * pi * (0:10e3) * 1e3 / fs2);
%x2 = [0:1/fs2:5e3, 5e3-1:1/fs2:10e3];
% pause; soundsc(x, fs2)
fc = 48e3; fs1 = 192e3;
x1up = interp(x1, fs1/fs2);
x2up = interp(x2, fs1/fs2);
Nx = length(x2up);

x=(1+0.5*x1up).*cos(2*pi*((fc*(0:Nx-1)/fs1).'+10e3*cumsum(x2up)/fs1));
figure; plot(x); title("AM + FM upsampled")

xA = hilbert(x);
figure; plot(abs(xA)); title("AM upsampled")
% pause; soundsc(abs(xA), fs1);

ang = unwrap(angle( xA ));
xF = (1/(2*pi)) * (ang(3:end)-ang(1:end-2)) / (2/fs1) - fc;
figure; plot(xF); title("FM upsampled")
% pause; soundsc(xF, fs1);

xAdown = decimate(abs(xA), fs1/fs2);
figure; plot(xAdown); title("AM downsampled")
% pause; soundsc(xAdown, fs2)
errA = mean(abs(x1-(2*(xAdown-1))))

xFdown = decimate(xF, fs1/fs2);
figure; plot(xFdown); title("FM downsampled")
% pause; soundsc(xFdown, fs2)
errF = mean(abs(x2-(xFdown/10e3)))

y = [2*(xAdown-1); xFdown/10e3];
figure; hold on;
plot(x0), plot(y)
% pause; soundsc(y, fs2)
err = mean(abs(x0 - y))