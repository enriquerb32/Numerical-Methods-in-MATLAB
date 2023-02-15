%Newton-Raphson

function [root,iter] = newton_raphson(f,x0,es)
%input:
%f = function
%x0 = starting point
%es = root's wanted precision
%output:
%root = root aproximated value
%iter = needed iterations
syms x;
ea = 100;
i = 0;
xi = x0;
g = diff(f);
fprintf('i\t\tx(i)\t\t\t\t\t\t\tx(i+1)\t\t\t\t\t\t\tf(xi)\t\t\t\t\t\t\tdf(xi)\t\t\t\t\t\t\tE(a)\n');
while ea>es
    f2 = double(subs(f,x,xi));
    g2 = double(subs(g,x,xi));
    xj = xi - f2/g2;
    ea = (abs((xj-xi)/xj))*100;
    fprintf('%1d\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\n',i,xi,xj,f2,g2,ea);
    
    xi = xj;
    i = i+1;
end

root = xj;
iter = i;
end

