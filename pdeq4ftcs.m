%solution to q4 using FTCS
%defining parameters
c=1;
h=1/4;
r=0.4;
k=r*(h^2)/c;
Nx=1/h;
Nt=4;
x=0:h:1;
t=0:k:0.1;
U=zeros(Nx+1,Nt+1);
%initial conditions
for i=1:Nx+1
    U(i,1)=x(i);
end
for j=1:Nt+1
    U(1,j)=0;
end
%solving
for i=2:Nx
    for j=1:Nt
         U(i,j+1)=r*U(i-1,j)+(1-2*r)*U(i,j)+r*U(i+1,j);
         if j>=2
             U(Nx+1,j)=U(Nx,j)+h;
         end
     end
        
end
U(Nx+1,Nt+1)=U(Nx,Nt+1)*h;
figure1=plot(x,U); 
xlabel('x');
ylabel('U');
title('Solution to Q4');