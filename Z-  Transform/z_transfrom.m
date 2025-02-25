clc
clear all
close all
re_z=-3:0.1:3;
im_z=-3:0.1:3;
for ii=1:length(re_z)
    for jj=1:length(im_z)
        z_plan(ii,jj)=re_z(ii)+1j*im_z(jj);
        r(ii,jj)=abs(z_plan(ii,jj));
    end
end

[X, Y]=meshgrid(re_z, im_z);

n=-50:1:50;
len_n=length(n);
alpha=0.9;
A=1;
M=1;
N1=6;
N2=3;
TR=0;
[g_1_n] = sqn_gen_1(n, 1, alpha, A, M, N1);
[fliped_seq, TR] = flip_sqn(len_n, g_1_n, TR);
[g_2_n] = delay_sqn(fliped_seq, len_n, n, 0, TR);

subplot(3,1,1), stem(n, g_2_n)
ylabel("x(n)");
xlabel("n");


for ii=1:length(re_z)
    for jj=1:length(im_z)
        [G_1_z(jj,ii,:),omega_x] = DTFT_x1...
        (n, (r(ii,jj).^-n).*g_2_n);
    end
end

for ii=1:length(re_z)
    for jj=1:length(im_z)
        z_x(ii,jj)=sum(abs(G_1_z(ii,jj,:)));
    end
end

subplot(3,1,2),surf(X, Y, 10*log10(z_x),...
    'linestyle','none');
colorbar('Direction','reverse')
ylabel("Image(z)");
xlabel("Real(z)");

subplot(3,1,3),image( [re_z(1,1), re_z(1,end)],...
    [im_z(1, end), im_z(1,1)] ,10*log10(z_x));
colorbar('Direction','reverse')
ylabel("Image(z)");
xlabel("Real(z)");




%---------Partical Values-----------------------
% X_omega_mag=abs(X_omega);
% X_omega_angle=atan(imag(X_omega)./real(X_omega));



% subplot(4,1,2), plot(omega_x/pi, X_omega_mag, ...
%     omega_x/pi, X_omega_th_mag, '--k')
% ylabel("|X(\omega)|");
% xlabel("\omega");
% 
% subplot(4,1,3), plot(omega_x/pi, X_omega_angle, ...
%     omega_x/pi, X_omega_th_angle, '--k')
% ylabel("\angleX(\omega)");
% xlabel("\omega");


% [x_n_2] = IDTFT_x(X_omega, omega_x, n);
% subplot(4,1,4), stem(n, (x_n_2))











