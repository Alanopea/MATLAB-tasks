% dsp08_ex_iir_matlab.m
clear all; close all;
fpr=2000; f1=400; f2=600; N=8; Rp=3; Rs=80;         % 1) filter design requirements
[b,a] = ellip(N, Rp, Rs, [f1,f2]/(fpr/2),  'stop'); % 2) filter design
Npunkt=1000; freqz(b,a,Npunkt,fpr);                 % 3) verification of filter H(f)
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500;  % 4) signal parameters
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);              % 5) signal generation
y = filter(b,a,x);                                  % 6) signal filtration - two sums
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy stop');    % 7) filtration result 

pause;
 
fpr=2000; f1=200; f2=800; N=8; Rp=3; Rs=80;         
[b,a] = ellip(N, Rp, Rs, [f1,f2]/(fpr/2), 'stop'); 
Npunkt=1000; freqz(b,a,Npunkt,fpr);                 
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; 
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);              
y = filter(b,a,x);                                 
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy stop f1=200, f2=800');

pause;

fpr=2000; f1=200; f2=800; N=8; Rp=3; Rs=150;         
[b,a] = ellip(N, Rp, Rs, [f1,f2]/(fpr/2), 'stop'); 
Npunkt=1000; freqz(b,a,Npunkt,fpr);                 
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; 
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);              
y = filter(b,a,x);                                 
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy Rs=150');

pause;

fpr=2000; f1=400; f2=600; N=8; Rp=3; Rs=80;         
[b,a] = ellip(N, Rp, Rs, [f1,f2]/(fpr/2), 'bandpass'); 
Npunkt=1000; freqz(b,a,Npunkt,fpr);                 
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; 
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);              
y = filter(b,a,x);                                 
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy stop f1=200, f2=800');


pause;

fpr=2000; f=200; N=8; Rp=3; Rs=150;         
[b,a] = ellip(N, Rp, Rs, f/(fpr/2), 'low'); 
Npunkt=1000; freqz(b,a,Npunkt,fpr);                 
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; 
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);              
y = filter(b,a,x);                                 
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy low');

pause;

fpr=2000; f=600; N=8; Rp=3; Rs=40;         
[b,a] = ellip(N, Rp, Rs, f/(fpr/2), 'high'); 
Npunkt=1000; freqz(b,a,Npunkt,fpr);                 
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; 
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);              
y = filter(b,a,x);                                 
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy high');

pause;

clear all; close all;

fpr=2000; f1=400; f2=600; N=8; Rp=3; Rs=20;
[b, a] = butter(N, [f1, f2]/(fpr/2), 'stop');
Npunkt=1000; freqz(b,a,Npunkt,fpr);
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500;
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);
y = filter(b,a,x);
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy butterworth');

pause;

clear all; close all;

fpr=2000; f1=400; f2=600; N=8; Rp=3; Rs=20;
[b, a] = cheby1(N, Rp, [f1, f2]/(fpr/2), 'stop');
Npunkt=1000; freqz(b,a,Npunkt,fpr);
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500;
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t);
y = filter(b,a,x);
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy chebyshev type I');
 