clc
clear all
close all
n=-100:1:100;
len_n=length(n);
alpha=0.5;
A=1;
M=1;
N1=4;
N2=12;
TR=0;
[x_1_n] = sqn_gen_1(n,7, alpha, A, M, N1);
[x_2_n] = sqn_gen_1(n, 5, alpha, A, M, N2);
[y_1_n,n] =conv_x(n, len_n, x_1_n, x_2_n, TR);

subplot(3,1,1), stem(n, x_1_n)
ylabel("x_1[n]");
xlabel("n");

subplot(3,1,2), stem(n, x_2_n)
ylabel("x_2[n]");
xlabel("n");

subplot(3,1,3), stem(n, y_1_n)
ylabel("y_1[n]");
xlabel("n");

[Y_1_omega,omega_x] = DTFT_x1(n, y_1_n);


[X_1_omega,omega_x] = DTFT_x1(n, x_1_n);
[X_2_omega,omega_x] = DTFT_x1(n, x_2_n);

Y_2_omega=X_1_omega.*X_2_omega;

figure, subplot(3,1,1), plot(omega_x/pi, abs(X_1_omega), 'r');
ylabel("X_1(\omega)");
xlabel("\omega");

subplot(3,1,2), plot(omega_x/pi, abs(X_2_omega), 'k');
ylabel("X_2(\omega)");
xlabel("\omega");

subplot(3,1,3), plot(omega_x/pi, abs(Y_1_omega), 'k',...
    omega_x/pi, abs(Y_2_omega), '--r' );
ylabel("Y_2(\omega)");
xlabel("\omega");
























