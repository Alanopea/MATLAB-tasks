
function X = dsp05_ex13(x)
N = length(x);
    
    Xm = fft(x);
if N == 1
    X = x;
else
    Xe = dsp05_ex13(x(1:4:end));
    Xo1 = dsp05_ex13(x(2:4:end));
    Xo2 = dsp05_ex13(x(3:4:end));
    Xo3 = dsp05_ex13(x(4:4:end));

    W = exp(-1i * 2 * pi / N);
    W1 = W;
    W2 = W^2;
    W3 = W^3;

    X = zeros(1, N);

    for k = 0:(N/4 - 1)

        
        X(k+1) = Xe(k+1) + W1^k * Xo1(k+1) + W2^k * Xo2(k+1) + W3^k * Xo3(k+1);
        X(k+N/4+1) = Xe(k+1) - 1i * (W1^k * Xo1(k+1) - W2^k * Xo2(k+1) + 1i * W3^k * Xo3(k+1));
        X(k+N/2+1) = Xe(k+1) - (W1^k * Xo1(k+1) + W2^k * Xo2(k+1) - W3^k * Xo3(k+1));
        X(k+3*N/4+1) = Xe(k+1) + 1i * (W1^k * Xo1(k+1) - W2^k * Xo2(k+1) - 1i * W3^k * Xo3(k+1));
    end
end

 error = max(abs( X - Xm )), pause(1)

end


%https://www.cmlab.csie.ntu.edu.tw/cml/dsp/training/coding/transform/fft.html
