clc,
clear,
close all
% Group 04
% Qingyu Zhang <vn22984@bristol.ac.uk>
% Shuran Yang  <rw22242@bristol.ac.uk>
% Ruilong Liu  <hx22195@bristol.ac.uk>

%frequency
F0 = 440;
Fs = 10e3;
%signal amplitude
A = 1;
%damping factor
r = 1;
SAMPLES = floor(Fs / F0);
omiga = 2* pi * F0 / Fs;

%coefficients
a1 = r * cos (omiga);
a2 = r * r;

%initialize ysin
yout = [A * sin(omiga), 0];
for i =3:1:10* SAMPLES
    y_temp = 2 * a1 * yout(1,i-1) - a2 * yout(1,i-2);
    yout = [yout(1,:), y_temp];
end

plot(yout)
xlabel('Samples');
ylabel('Amplitude');
title('Digital sinusidal wavreform output');
