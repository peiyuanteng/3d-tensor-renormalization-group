function y=testcpd(T,h,n)
Tin=tensori(T,h);
step=n;
Z=0;
Z0=0;
A=tensor(Tin);
Re=cp_als(A,step);
A0=Re.lambda;

%disp(A);
A1=full(Re.U{1});
A2=full(Re.U{2});
A3=full(Re.U{3});
for i=1:1:step
A1(:,i)=A1(:,i)*Re.lambda(i)^(1/3);
A2(:,i)=A2(:,i)*Re.lambda(i)^(1/3);
A3(:,i)=A3(:,i)*Re.lambda(i)^(1/3);
end

B1=zeros(2,2,4);
B2=zeros(2,2,4);
B3=zeros(2,2,4);
for i=1:1:step
for j=1:1:4
    j2=mod((j-1),2)+1;
    j1=(j-j2)/2+1;
    B1(j1,j2,i)=A1(j,i);
    B2(j1,j2,i)=A2(j,i);
    B3(j1,j2,i)=A3(j,i);
    
end
end
for b1=1:2
    for b2=1:2
        for b3=1:2
            for b4=1:2
                for b5=1:2
                    for b6=1:2
                        for j=1:1:step      
                            Z=Z+B1(b1,b2,j)*B2(b3,b4,j)*B3(b5,b6,j);
                        end                  
end
end
end
end
end
end


for o1=1:1:4
    for o2=1:1:4
        for o3=1:1:4
             Z0=Z0+Tin(o1,o2,o3);
        end
    end
end

y=(Z-Z0)/Z0;
disp(y);
end

