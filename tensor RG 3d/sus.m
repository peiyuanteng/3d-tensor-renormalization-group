function M=sus(H)

T(21)=0;
kai(21)=0;
f0(21)=0;
f(21)=0;
fm(21)=0;
h=0.01;
%this pamameter is the external magnetic field.

for x=H:0.1:H;
for i=1:1:41;
    T(i)=1.0+0.25*(i-1);


f1=tenratio(T(i),x);
y1=f1*T(i)/24;
f0(i)=y1;
f2=tenratio(T(i),x+h);
y2=f2*T(i)/24;
f(i)=y2;
f3=tenratio(T(i),x-h);
y3=f3*T(i)/24;
fm(i)=y3;


kai(i)=(fm(i)+f(i)-2*f0(i))/h^2;
end

plot(T,kai,'--s');
hold on;
filename = [ 'sus' num2str(x) '.mat' ];
save(filename,'T','kai','f0','f','fm');
end
title('Graph of susceptibility as a function of temperature','FontSize', 12);
xlabel('Temperature','FontSize', 15) % x-axis label
ylabel('Susceptibility','FontSize', 15) % y-axis label
legend('h=')

end