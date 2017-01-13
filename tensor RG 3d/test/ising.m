

function t= ising(a1,a2,a3,a4,a5,a6,T,h)
J=1;
beta=1/T;
%disp(beta);
t=exp(beta*J*(a1*a2+a2*a3+a3*a4+a4*a1+a5*a1+a6*a1+a5*a2+a6*a2+a3*a5+a3*a6+a4*a5+a4*a6)+0.5*h*beta*(a1+a2+a3+a4+a5+a6));
%disp(t);
end