function r=tensortest(Tin)
format long;
step=2;
A=tensor(Tin);

Re=cp_als(A,4,'init','nvecs');
A0=Re.lambda;
disp(A0);
A1=full(Re.U{1});
A2=full(Re.U{2});
A3=full(Re.U{3});
disp(A1);
disp(A2);
disp(A2);
number=0;
r=1;
end