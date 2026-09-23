clear all
close all
format long

% Load the file:
% The .txt file must be copied from the folder with main to the MATLAB folder
File=load('test_toll10^-14');

N=15483; % Depends on the number of steps in the file and is the number of steps performed by Lobatto,
                % printed by the compiler each time the program is executed and must be changed along with the file

t=zeros(1,N);u1=zeros(1,N);u2=zeros(1,N);u3=zeros(1,N);
% Split the File content into t, u1, u2, u3
for j=1:N

    t(j)=File(j,1);
    u1(j)=File(j,2);
    u2(j)=File(j,3);
    u3(j)=File(j,4);

end

% Now separate the part with times less than 10 (not needed) from the rest
i=1;
while t(i)<10
    i=i+1;
end
tempo=t(i-1:N);
x= u1(i-1:N);
y= u2(i-1:N);
z= u3(i-1:N);
w= y-z;

% Log-log scale plot
figure("Name",'log log x')
loglog(tempo,x);% In the second variable, you must use x, y, z, w..

figure("Name",'loglog y')
loglog(tempo,y);
figure("Name",'loglog z')
loglog(tempo,z);
figure("Name",'loglog w')
loglog(tempo,w);
% Semi-log scale plot
figure("Name",'semilog x')
semilogx(tempo,x);
%figure("Name",'semilog y')
%semilogx(tempo,y);
%grid on
%figure("Name",'semilog z')
%semilogx(tempo,z);
figure("Name",'semilog w')
semilogx(tempo,w);
%grid on
