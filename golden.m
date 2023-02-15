%Golden section methode for minimum finding

function [min,iter] = golden(f,xl,xu,es)
%input:
%f = function
%xl = x lower
%xu = x upper
%es = precision
%output:
%min = best aproximation of the minimum
%iter = number of iterations needed

gn = (1+sqrt(5))/2;     %golden number
i = 1;
ea = 100;

fprintf('i\t\tx(lower)\t\t\t\t\tf(xlower)\t\t\t\t\tx1\t\t\t\t\t\t\tf(x1)\t\t\t\t\t\tx2\t\t\t\t\t\t\tf(x2)\t\t\t\t\t\tx(upper)\t\t\t\t\tf(xupper)\t\t\t\t\td\t\t\t\t\t\t\tE(a)\n');
while(ea>es)
    %create x1 and x2:
    %the one with lower image to be the minimu aproximation of the
        %iteration
    %the one with higher image to be replace xu(if x2) or xl(if x1) in the
        %interval
    d = (gn-1)*(xu-xl); 
    x2 = xl+d;          
    x1 = xu-d;          
    xtop = xu;          %auxiliar xu parameter
    xbot = xl;          %auxiliar xl parameter
    
    %xopt = minimum aproximation of the iteration
    if f(x1)<f(x2)       
        xopt = x1;      
        xu = x2;        %reduction of the interval
    else
        xopt = x2; 
        xl = x1;
    end
    ea =(2-gn)*(abs((xtop-xbot)/xopt))*100;
    fprintf('%1d\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\t\t\t%1.15f\n',i,xbot,f(xbot),x1,f(x1),x2,f(x2),xtop,f(xtop),d,ea);
    i = i+1;
end
min = xopt;
iter = i-1;
end
    
    
        