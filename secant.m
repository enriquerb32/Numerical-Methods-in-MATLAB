% Secant method

function [root,iter] = secant (f,x0,x1,es)
%input:
%f = function
%x0 = lowest starting point
%x1 = highest starting point
%es = searched precision
%output:
%root = root's best aproximation
%iter = number of iterations needed

xh = x0;
xi = x1;
i = 1;
ea = 100;

fprintf('i\t\tx(i)\t\t\t\t\t\t\tf(xi)\t\t\t\t\t\t\tx(i+1)\t\t\t\t\t\t\tf(x(i+1))\t\t\t\t\t\tE(a)\n');
while ea>es
    xj = xi - (f(xi)/(f(xh)-f(xi)))*(xh-xi);
    ea = (abs((xj-xi)/xj))*100;
    fprintf('%1d\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\n',i,xi,f(xi),xj,f(xj),ea);
    
    xh = xi;
    xi = xj;
    i = i+1;
end

root = xj;
iter = i-1;
end
    