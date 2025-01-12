clc
close all
clear all

n = -20:1:20;
alpha = 0.7;
A = 10;
M = 1;
N = 6;
type_of_sqn = 4;

[dig_sqn_1] = digital_sqn_gen(n, type_of_sqn, alpha, A, M, N); 
stem(n, dig_sqn_1);

energyx = energ(dig_sqn_1)
xlabel('n');
ylabel('Amplitude');
title('Generated Signal');
