clear all
clc

n = 0:1:50;
alpha = 0.7;
A = 10;
M = 1;
N = 6;
type_of_sqn = 5;

h_n=[1 -1];
g_n = digital_sqn_gen(n, type_of_sqn, alpha, A, M, N);

L1=length(h_n);
L2=length(g_n);
L3= L1+L2-1;

h1=[h_n zeros(1, L2)];
g1=[g_n zeros(1, L1)];
y= zeros(1, L3);

for i=1:L3
    y(i)=0;
    for j=1:L1
        if(i-j+1>0)
            
            y(i)=y(i)+h1(j)*g1(i-j+1);
        end
    end
    n2(i)=i-1;
end   
y1=conv(h_n, g_n);

subplot(2,1,1), stem(n2, y);
ylabel('y[n]');
xlabel('----->n');

subplot(2,1,2), stem(n2, y1);
ylabel('y[n] by conv command');
xlabel('----->n');

