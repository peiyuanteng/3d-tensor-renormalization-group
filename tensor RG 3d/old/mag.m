function M=mag(h)

T(50)=0;
M(50)=0;
f0(50)=0;
f(50)=0;

%this pamameter is the external magnetic field.

for x=0:0.5:0;
parfor i=1:1:50;
    T(i)=2+(i-1);


[r1,r2,r3,r4,a1,a2,a3,a4]=tenratiof(T(i),x);
y=(3*(log(r1)+log(r2)/8+log(r3)/8/8+log(r4)/8/8/7)+(log(a1)+log(a2)/8+log(a3)/8/8+log(a4)/8/8/7))*T(i)/24;
f0(i)=y;
[r1,r2,r3,r4,a1,a2,a3,a4]=tenratiof(T(i),x+h);
y=(3*(log(r1)+log(r2)/8+log(r3)/8/8+log(r4)/8/8/7)+(log(a1)+log(a2)/8+log(a3)/8/8+log(a4)/8/8/7))*T(i)/24;
f(i)=y;
M(i)=(f(i)-f0(i))/h;
disp('-------------------------------');
end

plot(T,M,'--s');
hold on;
filename = [ 'mag0' num2str(x) '.mat' ];
save(filename,'T','M','f0','f');
end
title('Graph of Magnetization as a function of temperature','FontSize', 12);
xlabel('Temperature','FontSize', 15) % x-axis label
ylabel('Magnetization','FontSize', 15) % y-axis label
legend('h=-0.5','h=-0.25','h=0','h=0.25','h=0.5')

end