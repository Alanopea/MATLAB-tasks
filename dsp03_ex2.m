clear; clc; close all;
% Step 1: Define the vectors
v1 = [1/sqrt(8), 1/sqrt(8), 1/sqrt(8), 1/sqrt(8), -1/sqrt(8), -1/sqrt(8), -1/sqrt(8), -1/sqrt(8)];
v2 = [1/sqrt(8), 1/sqrt(8), -1/sqrt(8), -1/sqrt(8), 1/sqrt(8), 1/sqrt(8), -1/sqrt(8), -1/sqrt(8)];
v3 = [1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8)];
v4 = [1/sqrt(8), -1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8), 1/sqrt(8), 1/sqrt(8), -1/sqrt(8)];
v5 = [1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8), 1/sqrt(8)];
v6 = [1/sqrt(8), -1/sqrt(8), -1/sqrt(8), 1/sqrt(8), 1/sqrt(8), -1/sqrt(8), -1/sqrt(8), 1/sqrt(8)];
v7 = [1/sqrt(8), 1/sqrt(8), -1/sqrt(8), -1/sqrt(8), -1/sqrt(8), -1/sqrt(8), 1/sqrt(8), 1/sqrt(8)];
v8 = [1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8), -1/sqrt(8), 1/sqrt(8), -1/sqrt(8), 1/sqrt(8)];

A = [v1; v2; v3; v4; v5; v6; v7; v8];

disp('Dot products of vectors with v1:');
   for n = 1:8
       for m = 1:8

            prod = dot(A(n,:), A(m,:))
       end
   end



inverse_A = inv(A),
transpose_A = A',
