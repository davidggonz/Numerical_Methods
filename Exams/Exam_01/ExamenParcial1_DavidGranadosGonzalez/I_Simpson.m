function I = I_Simpson(f,a,b,n)
S0=f(a)+f(b);%Se evaluan los extremos
S1=0;%Evaluar los impares
S2=0;%Evaluar los pares
h=(b-a)/n;

for i=1:n-1
    x=a+i*h;
    if mod(i,2)==0
        S2=S2+f(x); %suma los pares de i
    else
        S1=S1+f(x); %suma los impares de i
    end
end
I=(h/3)*(S0+2*S2+4*S1);
end