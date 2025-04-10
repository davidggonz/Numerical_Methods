function[p,i] = Newton_Raphson(f,df,p0,tol,N)
 i = 1;
 while i <= N
     p = p0 - f(p0)/df(p0);
     if abs(p-p0) < tol
         break;
     end
     i = i+1; 
     p0 = p;
 end
 