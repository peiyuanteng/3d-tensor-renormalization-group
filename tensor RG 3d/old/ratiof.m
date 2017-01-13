function f=ratiof()

T(50)=0;
h(15)=0;
f(50,15)=0;
r1(50,15)=0;
r2(50,15)=0;
r3(50,15)=0;
r4(50,15)=0; 
a1(50,15)=0;
a2(50,15)=0;
a3(50,15)=0;
a4(50,15)=0;
for i=1:1:80;
    T(i)=1.2+0.1*(i-1);
for j=1:1:15;
    h(j)=-0.14+0.02*(j-1);
[r1(i,j),r2(i,j),r3(i,j),r4(i,j),a1(i,j),a2(i,j),a3(i,j),a4(i,j)]=tenratiof(T(i),h(j));
f(i,j)=(3*(log(r1(i,j))+log(r2(i,j))/8+log(r3(i,j))/8/8+log(r4(i,j))/8/8/7)+log(a1(i,j))+log(a2(i,j))/8+log(a3(i,j))/8/8+log(a4(i,j))/8/8/7)*T(i)/24;
end
disp(i);    
end
filename='resultf.mat';
save('resultf.mat','f','r1','r2','r3','r4','a1','a2','a3','a4','h','T');
mesh(h,T,f);
title('Free energy as a function of h and T(3D)','FontSize', 15);
ylabel('Temperature','FontSize', 15);
xlabel('Magnetization','FontSize', 15);
zlabel('Free energy per spin','FontSize', 15);


end