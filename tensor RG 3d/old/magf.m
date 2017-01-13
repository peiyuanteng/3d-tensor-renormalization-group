function M=magf(h)

T(51)=0;
M(51)=0;
f0(51)=0;
f1(51)=0;
f2(51)=0;
%this pamameter is the external magnetic field.

for x=0:0.1:0;
for i=1:1:51;
    T(i)=1+0.25*(i-1);


f=tenratioff(T(i),x);
y=f*T(i)/24;
f0(i)=y;
f=tenratioff(T(i),x+h);
y=f*T(i)/24;
f1(i)=y;
f=tenratioff(T(i),x+2*h);
y=f*T(i)/24;
f2(i)=y;
M(i)=(4*f1(i)-3*f0(i)-f2(i))/h/2;
disp('-------------------------------');
disp(i);
disp('-------------------------------');
end

plot(T,M);
hold on;
filename = [ 'mag' num2str(x) '.mat' ];
save(filename,'T','M','f0','f1','f2');
end
title('Graph of Magnetization as a function of temperature','FontSize', 12);
xlabel('Temperature','FontSize', 15) % x-axis label
ylabel('Magnetization','FontSize', 15) % y-axis label
legend('h=0.5')

end