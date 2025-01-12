function [x_n_recon] = idft_x(X_omega,omegax,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

omega_ss=abs(omegax(1)-omegax(2));

for ii=1:length(n)
     expo2(ii,:)=exp(1j*omegax.*n(ii));
    temp1=X_omega.*expo2(ii,:);

     x_n_recon(ii)=(1/(2*pi))*my_int_fun(temp1, omega_ss);
end
 
end

