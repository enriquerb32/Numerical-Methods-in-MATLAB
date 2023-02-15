% Manual polynomial interpolation: Newton method

function y = newton(r,f,xint)
%input:
%r = vector with n known points
%f = set of images
%xint = point on which we want to obtain an interpolation
%output:
%y = image of xint

%Ordenació dels punts
n = numel(r);
d = zeros(1,n);
b = zeros(1,n);

for i=1:n
    d(i) = abs(xint-r(i));
end
for j = 1:n-1
    for i=1:n-j
        if d(i)>d(i+1)
            aux = r(i+1);
            aux2 = f(i+1);
            aux3 = d(i+1);
            r(i+1) = r(i);
            f(i+1) = f(i);
            d(i+1) = d(i);
            r(i) = aux;
            f(i) = aux2;
            d(i) = aux3;
        elseif d(i) == d(i+1)
            if r(i)<r(i+1)
                aux = r(i+1);
                aux2 = f(i+1); 
                aux3 = d(i+1);
                r(i+1) = r(i);
                f(i+1) = f(i);
                d(i+1) = d(i);
                r(i) = aux;
                f(i) = aux2;
                d(i) = aux3;
            end
        end
    end
end
fprintf('x(i)\t\t'); fprintf('%1d\n',r);

% Creation of associated grid
for j=1:n
    g = zeros(1,n-j+1);
    aux = zeros(1,n-j+1);
    for i = 1:n-j+1
        g(i) = (f(i+1)-f(i))/(r(i+j)-r(i));
        aux(i) = f(i);
        f(i) = g(i);
    end
    b(j) = aux(1);
    fprintf('g(j)\t\t'); fprintf('%1.15f\n',aux);
end
fprintf('b(i)\t\t'); fprintf('%1.15f\n',b);

% Calculation of the image of associated polynomial
q = 1;
p = b(1);
for i =1:n-1
     q = q*(xint-r(i));
     p = p + b(i+1)*q;
end

y = p;
end
