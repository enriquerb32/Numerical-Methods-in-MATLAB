%Bisection methode function
function xr = bisectio(f,xl,xu,es)
%input:
%f = symbolic function
%xl = lower value of the interval
%xu = upper value of the interval
%es = result precision wondered
xold = 0;
n = fix(log2(100*((xu-xl)/es)))+1;
syms x;

fprintf('n\tx(lower)\t\t\t\tsig[f(xlower)]\t\t\t\tx(upper)\t\t\tsig[f(xupper)]\t\t\t\tx(r)\t\t\t\tsig[f(xr)]\t\t\t\tE(s)\t\t\t\tE(a)\n');
for i=1:n
    fl = subs(f,x,xl);
    s1 = sign(double(fl));
    fu = subs(f,x,xu);
    s2 = sign(double(fu));
    
    xr = (xu+xl)/2;
    fr = subs(f,x,xr);
    sr = sign(double(fr));
    ea = (abs((xr-xold)/xr))*100;
    fprintf('%1d\t\t%1.15f\t\t\t\t%1d\t%1.15f\t\t\t\t%1d\t%1.15f\t\t\t\t%1d\t%1.15f\t\t\t\t%1.15f\n',i,xl,s1,xu,s2,xr,sr,es,ea);
    
    if s1 == sr
        xl = xr;
    else
        xu = xr;
    end
    
    xold = xr;
end
end

    
    


