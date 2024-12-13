clear all
close all
format long


% carico il file:
% il file .txt va copiato dalla cartella col main nella cartella di
% matlab,
File=load('test_toll10^-14');

 
N=15483; %dipende da numero step del file ed è il numero di passi fatti da lobatto,
                % viene stampato a compilatore ogni volta che eseguiamo il
                % programma e va ogni volta cambiato come il file

t=zeros(1,N);u1=zeros(1,N);u2=zeros(1,N);u3=zeros(1,N);
% suddivido il contenuto del File in t,u1,u2,u3
for j=1:N
    
    t(j)=File(j,1);
    u1(j)=File(j,2);
    u2(j)=File(j,3);
    u3(j)=File(j,4);
    
end

% adesso separo la parte di tempi minori di 10 che non mi interessa dal resto
i=1;
while t(i)<10
    i=i+1;
end
tempo=t(i-1:N);
x= u1(i-1:N);
y= u2(i-1:N);
z= u3(i-1:N);
w= y-z;

%grafico in scala loglog
figure("Name",'log log x')
loglog(tempo,x);% nella seconda variabile bisogna mettere x,y,z,w..
                    
figure("Name",'loglog y')
loglog(tempo,y); 
figure("Name",'loglog z')
loglog(tempo,z); 
figure("Name",'loglog w')
loglog(tempo,w);
%plot con scala semilog
figure("Name",'semiloglog x')
semilogx(tempo,x);
%figure("Name",'semiloglog y')
%semilogx(tempo,y);
%grid on
%figure("Name",'semiloglog z')
%semilogx(tempo,z);
figure("Name",'semiloglog w')
semilogx(tempo,w);
%grid on



