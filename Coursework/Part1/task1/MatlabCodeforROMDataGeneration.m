% Group 04
% Qingyu Zhang <vn22984@bristol.ac.uk>
% Shuran Yang  <rw22242@bristol.ac.uk>
% Ruilong Liu  <hx22195@bristol.ac.uk>

clc,
clear,
close all

% roshan.weerasekera@bristol.ac.uk
freq = 200; % signal frequency in Hz
SAMPLES = 512;		% Samples per full-cycle
WIDTH = 9;			% Size of data in bits
OUTMAX = 2^WIDTH - 1;	% max Amplitude of sinewave

% FIR filter parameters
% sample rate
Fs = SAMPLES * freq; 
% passband cut-off frequency
Fc = freq;
% windows length
L = 7; 
% windows order
M = L-1;
%omega
omiga = 2 * pi * Fc/Fs;

t = linspace(0,1/freq,SAMPLES);
rng default  %initialize random number generator
% x = 0.7*sin(2*pi*freq*t) + 0.25*rand(size(t)); 
x = 0.7 * sin(2 * pi * freq * t) + 0.25 * rand(size(t));

x = (OUTMAX*(1+x)); % normalize the amplitude of x so that it can be represented by 10bits
filename = 'ROMData.mem';
fid = fopen(filename,'w');
for i = 0:SAMPLES-1
	fprintf(fid,'%4X \n',int16(x(i+1)));
end
fclose(fid);

%FIR algorithm
input_signal = x;
a = 0.54;
n = -M/2:1:M/2;
zero_normal = find(n==0); 
n(zero_normal) = 0.0000001;
W_hamming = a - (1-a) * cos(2*pi*n./(L-1)); % Hanming
W_rect = 1;
H_result = omiga ./ pi * my_sinc(omiga * n);
b = W_rect .* H_result;
% b = H_result;
% % Normalised filter coefficients
b = b/sum(b);

w = 0:0.0001:pi;
H_response = zeros(1,1);
z = exp(1j*w);
for i = 1 : L
    H_response = H_response + z.^(n(1,i)) .* b(1,i);
end

figure(1)
subplot(1,2,2)
plot(w,log10(abs(H_response)),'r')
title('Frequency response');
xlabel('Normalized Frequency (x pi rad/sample)')
ylabel('Magnitude (dB)')
grid on

subplot(1,2,1)
% FIR pole
zplane(b);
xlim([-1.2 1.2])
ylim([-1.2 1.2])
title('zplane');
xlabel('Real part')
ylabel('Imaginary part')
grid on

% Filtered signal
output_signal = my_conv(input_signal, b); 

figure;
plot(input_signal(L:SAMPLES), 'b-');
hold on;
plot(output_signal(L:SAMPLES), 'r-');
xlabel('Time (s)');
ylabel('Amplitude');
title('Moving Average Filter in MATLAB');
legend('Input Waveform', 'Output Waveform');


