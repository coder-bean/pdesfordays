%solution to Q1. Using iterative method.
%defining parameters
h=1/10;
n=1/h;
x=0:h:1;
y=zeros(1,n+1);
ynew=ones(1,n+1);
error=1;
f=0.4255*exp(x)-0.4255*exp(-x)-x; %exact solution
%initial conditions
ynew(1)=0;
ynew(n+1)=0;
%choosing tolerance as 1e-6
tol=1e-6;
%iterative solution
while error>tol
    for i=2:1:n
        ynew(i)=(y(i+1)+y(i-1)-h*h*x(i))*1/(2+h*h) ;
    end
   error = max(abs(ynew - y));
   y = ynew;
end
% Plotting the solution
plot(x,f, 'r.-', 'LineWidth', 3);
hold on;
plot(x, y, 'b.-', 'LineWidth', 1.5);
hold off;
title('Solution to Problem 1');
xlabel('x');
ylabel('y');
grid on;






