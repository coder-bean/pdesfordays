%solution for Q2
%defining parameters:
h=1/3;
k=1/3;
Nx=1/h;
Ny=1/k;
x=0:h:1;
y=0:k:1;
tol=1e-6;
error=1;
U=zeros(Nx+1,Ny+1);
Unew=ones(Nx+1, Ny+1);
%initial conditions
for i=1:Nx+1
    Unew(1,i)=0;
    Unew(Ny+1,i)=x(i);
end
for j=1:Ny+1
    Unew(j,1)=0;
    Unew(j,Nx+1)=y(j);
end
%solving the discretized equation
while error>tol
    for i=2:Nx
        for j=2:Ny
            Unew(i,j)=(k*k*U(i-1,j)+k*k*U(i+1,j)+h*h*U(i,j-1)+h*h*U(i,j+1))*1/(2*(h*h+k*k));
        end
    end
    error=max(abs(Unew-U));
    U=Unew;
end
%plotting the solution
[X, Y] = meshgrid(x, y);
surf(X, Y, U'); 
xlabel('x');
ylabel('y');
zlabel('U');
title('Solution to Q2');
