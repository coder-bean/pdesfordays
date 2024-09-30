%solution for q8
%defining parameters
h=1/100;
r=0.4;
c=1;
k=r*h/c;
x=0:h:1;
t=0:k:1;
Nx=floor(1/h);
Nt=floor(1/k);
U=zeros(Nx+1, Nt+1);
%initial conditions
for i=1:Nx+1
    U(i,1)=sin(pi*x(i));
end
for j=1:Nt+1
    U(1,j)=0;
    U(Nx+1,j)=0;
end
%solving
for i=2:Nx
    U(i,2)=(1/2)*((r^2)*U(i+1,1)+2*(1-r^2)*U(i,1)+r*r*U(i-1,1));
end
for i=2:Nx
    for j=3:Nt
        U(i,j+1)=(r^2)*U(i+1,j)+2*(1-r*r)*U(i,j)+r*r*U(i-1,j)-U(i,j-1);
    end
end
plot(t,U); 
xlabel('t');
ylabel('U');
title('Solution to Q8');

            