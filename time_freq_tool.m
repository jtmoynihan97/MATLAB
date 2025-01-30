% Time / Freq. Domain Analysis Tool

close all
clear
clc

% Number of samples in time array MUST be equal to signal duration times
% sampling rate.

% Number of samples in freq array MUST be equal to number of samples in
% time array, divided by two and plus one (for single-sided freq response).

% tMax = 2;
% fMax = 10;
% fSample = 200*fMax;
% N = tMax*fSample;
% t = linspace(0,tMax,N);

fMax = 10;
fSample = 200*fMax;


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
