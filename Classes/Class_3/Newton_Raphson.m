%We define a function & its derivative

f = @(x) x.^3 + 4*x.^2 -7;
df = @(x) 3*x.^2 + 8*x;
%We define a space
x = (-10:0.1:10)';

figure(1);
plot(x,f(x),'b');
ylim([-15 15]);
grid("on");

%--------------------------------
 p0 = -2;
 tol = 1e-8;
 N = 20;

[p,i] = Function_Newton_Raphson(f,df,p0,tol,N);

% i = 1;
% while i <= N
%     p = p0 - f(p0)/df(p0);
%     if abs(p-p0) < tol
%         break;
%     end
%     i = i+1; 
%     p0 = p;
% end