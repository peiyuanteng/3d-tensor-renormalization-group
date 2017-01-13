function M=mag(H)


h=0.01;
%this pamameter is the external magnetic field.

for x=H:0.1:H;
for i=1:1:51;
    T(i)=1+0.25*(i-1);


f=tenratio(T(i),x);
y=f*T(i)/24;
f0(i)=y;
disp(f0(i));

f=tenratio(T(i),x+h);
y=f*T(i)/24;
f1(i)=y;
disp(f1(i));

%f=tenratio(T(i),x+2*h);
%y=f*T(i)/24;
%f2(i)=y;
%M(i)=(4*f1(i)-3*f0(i)-f2(i))/h/2;
M(i)=((f1(i)-f0(i))/h);
    
disp('-------------------------------');
disp(i);
disp('-------------------------------');
end

plot(T,M,'*');
hold on;
filename = [ 'mag' num2str(x) '.mat' ];
save(filename,'T','M','f0','f1');
end
title('Graph of Magnetization as a function of temperature','FontSize', 12);
xlabel('Temperature','FontSize', 15) % x-axis label
ylabel('Magnetization','FontSize', 15) % y-axis label
legend('h=0 TRG')

end
