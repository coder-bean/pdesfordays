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
A=[1+2*r, -r,0; -r, 1+2*r, -r; 0, -r,1+2*r];
B=[1-2*r, r,0; r, 1-2*r, r; 0, r,1-2*r];
%initial conditions
for i=1:Nx+1
    U(i,1)=x(i);
end
for j=1:Nt+1
    U(1,j)=0;
end
for j=2:Nt+1
    Un=[U(2,j-1); U(3,j-1); U(4,j-1)];
    F=[r*U(1,j-1)+r*U(1,j);0;r*U(5,j-1)+r*U(5,j)];
    answer=A\(B*Un+F);
    U(2,j)=answer(1);
    U(3,j)=answer(2);
    U(4,j)=answer(3);
    U(5,j)=U(4,j)+h;
end
plot(x,U); 
xlabel('x');
ylabel('U');
title('Solution to Q4');


