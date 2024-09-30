%solution to q10
%defining to parameters
h=1/100;
r=0.4;
c=1;
k=r*h/c;
x=0:h:2;
t=0:k:1;
Nx=floor(2/h);
Nt=floor(1/k);
U=zeros(Nx+1, Nt+1);
%initial conditions
for i=1:Nx+1
    if x(i)<1
        U(i,1)=x(i)*(x(i)-1);
    else
        U(i,1)=1-x(i);
    end               
end                                                                       
for j=1:Nt+1
    U(1,j)=t(j);
end
%solving
for i=2:Nx
    for j=1:Nt
        U(i,j+1)=(1/2)*(r+r*r)*U(i-1,j)+(1-r*r)*U(i,j)+(1/2)*(r*r-r)*U(i+1,j);
    end
end
plot(x,U); 
xlabel('x');
ylabel('U');
title('Solution to Q10');



    