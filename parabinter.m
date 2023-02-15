function [xopt,fopt,ea,iter]=parabinter(func,x1,x3,es,maxit,varargin)
% prob0717: minimization parabolic interpolation
% [xopt,fopt]=prob0717(func,xlow,xhigh,es,maxit,p1,p2,...):
% uses parabolic interpolation to find the minimum of f
% input:
% f = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by f
% output:
% xopt = location of minimum
% fopt = minimum function value
if nargin<4,error('at least 3 input arguments required'),end
if nargin<5|isempty(es), es=0.0001;end
if nargin<6|isempty(maxit), maxit=50;end
iter = 0;
%x1 = xlow; x3 = xhigh;
x2 = (x1 + x3) / 2;
f1 = func(x1,varargin{:});
f2 = func(x2,varargin{:});
f3 = func(x3,varargin{:});
if f2<f1 & f2<f3
xoptold = x2;
while(1)
xopt=x2-0.5*((x2-x1)^2*(f2-f3)-(x2-x3)^2*(f2-f1))/((x2-x1)...
*(f2-f3)-(x2-x3)*(f2-f1));
fopt = func(xopt,varargin{:});
iter = iter + 1;
if xopt > x2
x1 = x2;
f1 = f2;
else
x3 = x2;
f3 = f2;
end
x2 = xopt; f2 = fopt;
if xopt~=0,ea=abs((xopt - xoptold) / xopt) * 100;end
xoptold = xopt;
if ea<=es | iter>=maxit,break,end
end
else
error('bracket does not contain minimum')
end