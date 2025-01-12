% Implementation of DTFT

clc
clear all
close all

n = -50:1:50;
alpha = 0.7;
A = 10;
M = 1;
N = 6;
type_of_sqn = 3;

omega = -6*pi:0.01*pi:6*pi;
 
x_n = digital_sqn_gen(n, type_of_sqn, alpha, A, M, N);

for ii = 1:length(omega)
    for iii = 1:length(n)
    temp1(iii) = x_n(iii)* exp(-1j*omega(ii)*n(iii));
    end
    X_omega(ii) = sum(temp1);
end

for ii = 1:length(omega)
    abs_X_omega(ii) = 1/sqrt(1.49 - 1.4*cos(omega(ii))); 
   %abs_X_omega(ii) = 1;
end

subplot(2,1,1),stem(x_n);
subplot(2,1,2),plot (omega/pi,abs(X_omega),...
 omega/pi,abs_X_omega,'--r')
    