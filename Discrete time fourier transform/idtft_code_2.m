clc
clear all
close all

n=-50:1:50;
type_of_sqn=3;
alpha=0.7;
Amp=1;
M=1;
N=1;
x_n=digital_sqn_gen(n, type_of_sqn,...
    alpha, Amp, M, N);

% omega_ss=0.001*pi;
% omegax=-pi:omega_ss:pi;
% 
% for ii=1:length(omegax)
%     expo(ii,:)=exp(-1j*omegax(ii).*n);
%     temp1=x_n.*expo(ii,:);
%     X_omega(ii)=sum(temp1);
% end

[X_omega,omegax] = dtft_x(x_n, n);
angle_X_omega = atan(imag(X_omega)./real(X_omega))

 for ii= 1:length(omegax)
    X_omega_th(ii) = (1/(1-alpha*exp(-1j*omegax(ii))));
    angle_X_omega_th(ii) = 1 * atan(alpha*sin(omegax(ii)/(1-alpha*cos(omegax(ii));
 end
 
 
subplot(3,1,1), stem(n, x_n);
xlabel("n")
ylabel("x[n]")

 subplot(3,1,2), plot(omegax/pi, abs(X_omega),'r',...
 omegax/pi,abs (X_omega_th),'--k' );
 xlabel("\omega")
 ylabel("X(\omega)")
 
  subplot(3,1,3), plot(omegax/pi, angle_X_omega );
 xlabel("\omega")
 ylabel("X(\omega)")
 
% for ii=1:length(n)
%     expo2(ii,:)=exp(1j*omegax.*n(ii));
%     temp1=X_omega.*expo2(ii,:);
%     omega_ss=abs(omegax(1)-omegax(2));
%     x_n_recon(ii)=(1/(2*pi))*my_int_fun(temp1, omega_ss);
% end
% 
% subplot(3,1,3), stem(n, abs(x_n_recon), 'g');
% xlabel("n")
% ylabel("x_r[n]")










