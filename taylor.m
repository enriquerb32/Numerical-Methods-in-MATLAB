% Program for Taylor development
function y = taylor(f,x0,z,n)
%input:
%function
%point of development
%image point 
         
q = subs(f,x,z);    
q = double(q);

fprintf('n\t f(x)\t\t\t\tP(n)\t\t\t\tReste\t\t\t\tE(real)\t\t\t\tE(aprox)\t\t\t\tO(h(n+1))\n');

% Loop elements:
    % p = y(n-1) = Taylor polynomial for previous iteration
    % y = y(n) = polynomial for corresponding iteration
    % ereal = real relative error for the approximation
    % eaprox = approximated relative error for the approximation
    % 0 = error for the neglected term O(h(n+1))
    % R = rest of the approximation
    
p = 0;          
for i=1:(n+1)
    y = taylor(f,x,x0,'Order',i);
    y = subs(y,x,z);
    y = double(y);
    ereal = (abs((q-y)/q))*100;
    eaprox = (abs(1-p/y))*100;
    O = (((z-x0)^(i))/factorial(i))*100;
    R = (q-y);
    fprintf('%1d\t %1.15f\t%1.15f\t%1.15f\t%1.15f\t%1.15f\t%1.15f\n',i-1,q,y,R,ereal,eaprox,O);
    p = y;
end
end
