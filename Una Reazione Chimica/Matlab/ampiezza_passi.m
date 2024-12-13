clear all
close all
format long
File=load('test_toll10^-14');

N=15483;
t=zeros(1,N);
for j=1:N
    
    t(j)=File(j,1);
    
end
ampiezza_passo=t(2:N)-t(1:N-1);
figure("Name",'Ampiezza passo scala lineare')
plot(t(2:N), ampiezza_passo);
%grid on;
figure("Name",'Ampiezza passo scala semilogx')
semilogx(t(2:N), ampiezza_passo);
%grid on;
