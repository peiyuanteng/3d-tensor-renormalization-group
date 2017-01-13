function M=spe()




t=0.1;

T(41)=0;
kai(41)=0;
fp(41)=0;
f0(41)=0;
fm(41)=0;

%this pamameter is the external magnetic field.


for x=0.3:0.3:0.3

for i=1:1:51;

T(i)=1+0.25*i;

f1=tenratio(T(i),x);
y1=f1*T(i)/24;
fp(i)=y1;
f2=tenratio(T(i)+t,x);
y2=f2*T(i)/24;
f0(i)=y2;
f3=tenratio(T(i)-t,x);
y3=f3*T(i)/24;
fm(i)=y3;


E(i)=(fp(i)-fm(i))/2/t*T(i)*T(i);
C(i)=(fp(i)+fm(i)-2*f0(i))/t/t*T(i)*T(i)+2*E(i)/T(i);


end


disp('------------------------------------');
plot(T,C,'--s');
hold on;
filename = [ 'spe' num2str(x) '.mat' ];
save(filename,'T','E','C','f0','fp','fm');
end

title('Heat capacity as a function of temperature','FontSize', 15);
xlabel('Temperature','FontSize', 20) % x-axis label
ylabel('Heat capacity','FontSize', 20) % y-axis label
legend('h=0','h=0.1','h=0.2','h=0.3','h=0.4','h=0.5')

end