% dsp03_ex_transforms.m - orthogonal transformations of signals
clc; clear; close all;

% Orthogonal matrix for DCT-IV orthogonal transform
N = 100;                                    % transformation order (square matrix size)
k = (0:N-1); n=(0:N-1);                     % columns=functions, rows=samples
S = sqrt(2/N)*cos(pi/N*(n'+1/2)*(k+1/2));   % synthesis matrix
A = S';                                     % analysis matrix: conjugation+transposition of S
S*A, pause                                  % checking matrix orthogonality

x1 = 10*S(:, 5);        % signal #1
x2 = 20*S(:,10);        % signal #2
x3 = 30*sqrt(2/N)*cos(pi/N*(n  +1/2)*(10.5+1/2) );      % signal #3
x4 = 30*sqrt(2/N)*cos(pi/N*(n'+N/4+1/2)*(10 +1/2) );    % signal #4
x5 = randn(1,N);                                % signal #5
x = x2; % choose x1, x2, x3, x4, x1+x2, x1+x3, x1+x4
figure; plot(x,'bo-'); title('x(n)'); grid;     % input

c = A*x;                % signal analysis: finding similarity coefficients
figure; stem(c);        % displaying similarity coefficients
%c(5) = 0;              % removing signal component x1
y = S*c;                % signal synthesis: summation of weighted elementary vectors
figure; plot(y,'bo-'); title('y(n)'); grid; % output
error = max(abs(x-y)), % signal reconstruction error