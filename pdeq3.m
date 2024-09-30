 %solution to q3
%defining parameters
h=1/2;
k=pi/4;
Nr=1/h;
Nth=pi/k;
r=0:h:1;
th=0:k:pi;
tol=1e-6;
error=1;
U=zeros(Nr+1,Nth+1);
Unew=ones(Nr+1, Nth+1);
%initial conditions
for i=1:Nr+1
    Unew(i,Nth+1)=0;
    Unew(i,1)=0;
    U(i,1)=0;
    U(i,Nth+1)=0;
    U(i,1)=0;
end
for j=1:Nth+1
    Unew(Nr+1,j)=4*(pi*th(j)-th(j)*th(j))/pi;
    U(Nr+1,j)=4*(pi*th(j)-th(j)*th(j))/pi;
end
%solving
while error>tol
    for i=2:Nr
        for j=2:Nth
            Unew(i,j)=(1/(h^2)+1/(2*h*(r(i+1))))*U(i+1,j)+(-2/(h^2)-2/(r(i+1)^2)*k^2)*U(i,j)+(1/(h^2)-1/(r(i+1)*2*h))*U(i-1,j)+(1/(r(i+1)^2+k^2))*U(i,j+1)+(1/((r(i+1)^2)*k^2))*(U(i,j-1));
        end
    end
    error=max(abs(Unew-U));
    U=Unew;
end
% Convert polar coordinates to Cartesian coordinates
x = zeros(length(r), length(th));
y = zeros(length(r), length(th));
for i = 1:Nr+1
    for j = 1:Nth+1
        x(i, j) = r(i) * cos(th(j));
        y(i, j) = r(i) * sin(th(j));
    end
end
surf(x, y, U); 
xlabel('x');
ylabel('y');
zlabel('U');
title('Solution to Q3');



