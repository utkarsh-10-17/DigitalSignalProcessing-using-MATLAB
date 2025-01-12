clc 
clear all
close all

N = 8;
n = 0:1:N-1;
k = 0:1:N-1;

for ii = 1:N
     if (n(ii)==0)
        x_n(ii) = 1;
    else
        x_n(ii) = 0;
     end
end
subplot(4,1,1),stem(n,x_n);

xlabel("n")
ylabel("x(n)")

for ii = 1:N
    for jj = 1:N
        D_inv(jj,ii) = exp(-j*(2*pi/N)*n(ii)*k(jj))
        
    end
end

X_k=D*x_n';

X_mag = abs(x);
X_angle = atan((imag(x))./real(x));

subplot(4,1,2),stem(k,x_mag ,'r');

xlabel("k")
ylabel("X(k)")

subplot(4,1,3),stem(k,x_angle,'g');

xlabel("k")
ylabel("\angleX(k)")

x_n_r = (1/N)*D_inv*X_K;

subplot(4,1,4),stem(n,x_n_r ,'k');

xlabel("k")
ylabel("X(k)")



