function [x_n_recon,n] = inv_dft(X_omega, omegax,n)

omega_ss=abs(omegax(1)-omegax(2));
for ii=1:length(n)
    expo2(ii,:)=exp(1j*omegax.*n(ii));
    temp1=X_omega.*expo2(ii,:);
    
    x_n_recon(ii)=(1/(2*pi))*int_func(temp1, omega_ss);
end
end

