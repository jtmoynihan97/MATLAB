% Time / Freq. Domain Analysis Tool

close all
clear
clc

f1 = 10;
f2 = 36;
fSample = 1000*max([f1,f2]);
tMax = 10;
N = tMax*fSample;

t = linspace(0,tMax,N);
w1 = 2*pi*f1;
w2 = 2*pi*f2;
f_t = cos(w1*t)+cos(w2*t);

[F_w,freq] = FourierTransform(f_t,fSample);
[f_ti,ti] = InverseFourierTransform(F_w,fSample);

figure
hold on
plot(t,f_t)
plot(ti,f_ti)
hold off
grid on

figure
plot(freq,abs(F_w))
xlim([0 2*max([f1,f2])])

function [Fw,freq] = FourierTransform(ft,Fs)
    
    T = 1/Fs;
    N0 = length(ft);
    t = (0:N0-1)*T;

    Y = fft(ft);
    P2 = Y;
    P1 = P2(1:N0/2+1);

    T0 = N0*T;
    df = 1/T0
    freq = (0:length(P1)-1)*df;
    Fw = P1;
    
end

function [ft,t] = InverseFourierTransform(Fw, Fs)
    
    T = 1/Fs; % Sampling period
    N0 = 2 * (length(Fw) - 1); % Total number of points in the original signal
    T0 = N0 * T; % Total duration of the signal
    df = 1 / T0; % Frequency resolution
    
    % Reconstruct the full Fourier Transform (symmetric about the Nyquist frequency)
    P2 = [Fw, conj(Fw(end-1:-1:2))];
    
    % Inverse FFT
    ft = ifft(P2, 'symmetric');
    
    % Generate the time vector
    t = (0:N0-1) * T;

end
