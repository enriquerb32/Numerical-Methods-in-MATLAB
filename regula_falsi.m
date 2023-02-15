%Regula falsi

function xr = regula_falsi(f,xl,xu,es)
%input:
%f = function
%xl = lower starting value
%xu = upper starting value
%es = result wanted precision
%output:
%root = best root aproximation

ea = 100;
xold = 0;
i = 1;
fprintf('i\t\tx(lower)\t\t\t\t\t\tf(xlower)\t\t\t\t\t\tx(upper)\t\t\t\t\t\tf(xupper)\t\t\t\t\t\tx(r)\t\t\t\t\t\t\tf(xr)\t\t\t\t\t\t\tE(a)\n');

while ea>es
    fl = f(xl);
    fu = f(xu);
    xr = xu - (fu/(fl-fu))*(xl-xu);
    fr = f(xr);
    ea = (abs(xr-xold)/xr)*100;
    fprintf('%1d\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\t\t\t\t%1.15f\n',i,xl,fl,xu,fu,xr,fr,ea);
    
    if sign(fr) == sign(fl)
        xl = xr;
    else
        xu = xr;
    end
    xold = xr;
    i = i+1;
end
end

