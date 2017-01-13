function [Tout,r1,r2]=tensorf(Tin)
%format long;
step=2;
svd1d=4;

A=tensor(Tin);

%disp(A);
%A=rand(4,4,4);
%A=tensor(A);
seed = {[1 ;0.5 ;0.5 ;2],[1 ;0.5 ;0.5 ;2],[1 ;0.5 ;0.5 ;2]};
Re=cp_als(A,1,'init',seed); 
%Re=tucker_als(A,1,'init',seed); 
A0=Re.lambda;
%A0=Re.core(1,1,1);
disp(A0);

A1=zeros(4,2);
A2=zeros(4,2);
A3=zeros(4,2);

A1(:,1)=full(Re.U{1});
A2(:,1)=full(Re.U{2});
A3(:,1)=full(Re.U{3});


   
for i=1:1:1
A1(:,i)=A1(:,i)*A0^(1/3);
A2(:,i)=A2(:,i)*A0^(1/3);
A3(:,i)=A3(:,i)*A0^(1/3);
end

AAT=zeros(4,4,4);
for i=1:1:4
for j=1:1:4
for k=1:1:4
    AAT(i,j,k)=A1(i,1)*A2(j,1)*A3(k,1);
end
end
end

%disp(AAT);
AAT1=AAT;
Ap=full(A)-AAT;
A=tensor(Ap);
seed = {[2 ;0.5 ;0.5 ;1],[2 ;0.5 ;0.5 ;1],[2 ;0.5 ;0.5 ;1]};
Re=cp_als(A,1,'init',seed); 
A0=Re.lambda;
%Re=tucker_als(A,1,'init',seed);
%A0=Re.core(1,1,1);
disp(A0);
X1=full(Re.U{1});
X2=full(Re.U{2});
X3=full(Re.U{3});

for i=1:1:4
A1(i,2)=X1(i)*A0^(1/3);
A2(i,2)=X2(i)*A0^(1/3);
A3(i,2)=X3(i)*A0^(1/3);
end



if 0
AAT=zeros(4,4,4);
for i=1:1:4
for j=1:1:4
for k=1:1:4
    AAT(i,j,k)=A1(i,2)*A2(j,2)*A3(k,2);
end
end
end
AAT2=AAT+AAT1;
%disp(AAT2);



Ap=full(A)-AAT;
A=tensor(Ap);
%disp(Ap);
seed = {[2 ;0.5 ;0.5 ;1],[2 ;0.5 ;0.5 ;1],[2 ;0.5 ;0.5 ;1]};
Re=cp_als(A,1,'init',seed); 
A0=Re.lambda;
%Re=tucker_als(A,1,'init',seed);
%A0=Re.core(1,1,1);
disp(A0);
X1=full(Re.U{1});
X2=full(Re.U{2});
X3=full(Re.U{3});

for i=1:1:4
A1(i,3)=X1(i)*A0^(1/3);
A2(i,3)=X2(i)*A0^(1/3);
A3(i,3)=X3(i)*A0^(1/3);
end

AAT=zeros(4,4,4);
for i=1:1:4
for j=1:1:4
for k=1:1:4
    AAT(i,j,k)=A1(i,3)*A2(j,3)*A3(k,3);
end
end
end
AAT3=AAT+AAT2;
%disp(AAT3);

Ap=full(A)-AAT;
A=tensor(Ap);
%disp(Ap);
seed = {[2 ;0.5 ;0.5 ;1],[2 ;0.5 ;0.5 ;1],[2 ;0.5 ;0.5 ;1]};
Re=cp_als(A,1,'init',seed); 
A0=Re.lambda;
%Re=tucker_als(A,1,'init',seed);
%A0=Re.core(1,1,1);
disp(A0);
X1=full(Re.U{1});
X2=full(Re.U{2});
X3=full(Re.U{3});

for i=1:1:4
A1(i,4)=X1(i)*A0^(1/3);
A2(i,4)=X2(i)*A0^(1/3);
A3(i,4)=X3(i)*A0^(1/3);
end

AAT=zeros(4,4,4);
for i=1:1:4
for j=1:1:4
for k=1:1:4
    AAT(i,j,k)=A1(i,4)*A2(j,4)*A3(k,4);
end
end
end
AAT4=AAT+AAT3;
%disp(AAT4);
end

%disp(A1);
%disp(A2);
%disp(A3);

B1=zeros(2,2,step);
B2=zeros(2,2,step);
B3=zeros(2,2,step);


for i=1:1:step
for j=1:1:4
    j2=mod((j-1),2)+1;
    j1=(j-j2)/2+1;
    B1(j1,j2,i)=A1(j,i);
    B2(j1,j2,i)=A2(j,i);
    B3(j1,j2,i)=A3(j,i);
    
end
end
C1=zeros(2,2,step,step);
C2=zeros(2,2,step,step);
C3=zeros(2,2,step,step);

for i1=1:1:step
    for i2=1:1:step
        for j1=1:1:2
            for j2=1:1:2
                for j0=1:1:2
                    C1(j1,j2,i1,i2)=C1(j1,j2,i1,i2)+B1(j1,j0,i1)*B1(j2,j0,i2);
                    C2(j1,j2,i1,i2)=C2(j1,j2,i1,i2)+B2(j1,j0,i1)*B2(j2,j0,i2);
                    C3(j1,j2,i1,i2)=C3(j1,j2,i1,i2)+B3(j1,j0,i1)*B3(j2,j0,i2);
                end
            end
        end
    end
end
Dsize=step*step*2;


D1=zeros(Dsize,Dsize);
D2=zeros(Dsize,Dsize);
D3=zeros(Dsize,Dsize);

for i1=1:1:step
    for i2=1:1:step
          ia=(i1-1)*step+i2;
          ib=ia;
        for j1=1:1:2
            for j2=1:1:2
            ja=(j1-1)*step*step+ia;
            jb=(j2-1)*step*step+ib;
            D1(ja,jb)= C1(j1,j2,i1,i2);
            D2(ja,jb)= C2(j1,j2,i1,i2);
            D3(ja,jb)= C3(j1,j2,i1,i2);
            end
        end
    end
end


[D1U,D1S,D1V] = svd (D1);
[D2U,D2S,D2V] = svd (D2);
[D3U,D3S,D3V] = svd (D3);

disp(diag(D1S));
for i=1:1:svd1d
d1(i)=sqrt(D1S(i,i));
d2(i)=sqrt(D2S(i,i));
d3(i)=sqrt(D3S(i,i));
end

disp(d1);
%disp(d2);
%disp(d3);


%ratio

r1=d1(1)^5;
r2=d2(1)^5;
r3=d3(1)^5;


%disp(r1);
%disp(r2);
%disp(r3);



E1=zeros(step,step,svd1d,2);
E2=zeros(step,step,svd1d,2);
E3=zeros(step,step,svd1d,2);


for i=1:1:svd1d
for k=1:1:Dsize
    k2=mod((k-1),(step*step))+1;
    k1=(k-k2)/(step*step)+1;  
    l2=mod((k2-1),step)+1;
    l1=(k2-l2)/step+1;
    E1(l1,l2,i,k1)=D1U(k,i)*d1(i);
    E2(l1,l2,i,k1)=D2U(k,i)*d2(i);
    E3(l1,l2,i,k1)=D3U(k,i)*d3(i);
end
end
Fsize=svd1d*svd1d*svd1d*svd1d;
F1=zeros(Fsize,Fsize);
F2=zeros(Fsize,Fsize);
F3=zeros(Fsize,Fsize);


tensors1 = {E1,E2,E1,E2,E1,E2,E1,E2};
tensors2 = {E1,E3,E1,E3,E1,E3,E1,E3};
tensors3 = {E2,E3,E2,E3,E2,E3,E2,E3};
legLinks = {[4 1 -1 9],[1 2 -2 10],[2 3 -3 11],[3 4 -4 12],[8 5 -5 9],[5 6 -6 10],[6 7 -7 11],[7 8 -8 12]};
sequence = [9 10 11 12 1 5 3 7 2 6 4 8];
FF1 = ncon(tensors1,legLinks,sequence);
FF2 = ncon(tensors2,legLinks,sequence);
FF3 = ncon(tensors3,legLinks,sequence);



for ka=1:1:Fsize
    ka1=mod((ka-1),(svd1d*svd1d))+1;
    ka2=(ka-ka1)/(svd1d*svd1d)+1;
    k1=mod((ka1-1),svd1d)+1;
    k2=(ka1-k1)/svd1d+1;
    k3=mod((ka2-1),svd1d)+1;
    k4=(ka2-k3)/svd1d+1; 
    
    for kb=1:1:Fsize
    kb1=mod((kb-1),(svd1d*svd1d))+1;
    kb2=(kb-kb1)/(svd1d*svd1d)+1;
    k5=mod((kb1-1),svd1d)+1;
    k6=(kb1-k5)/svd1d+1;
    k7=mod((kb2-1),svd1d)+1;
    k8=(kb2-k7)/svd1d+1; 
    
                            
                     F1(ka,kb)=FF1(k1,k2,k3,k4,k5,k6,k7,k8);
                     F2(ka,kb)=FF2(k1,k2,k3,k4,k5,k6,k7,k8);   
                     F3(ka,kb)=FF3(k1,k2,k3,k4,k5,k6,k7,k8);    
    
    end

end





F1=F1./r1;
F2=F2./r1;
F3=F3./r1;



[F1U,F1S,F1V] = svd (F1);
[F2U,F2S,F2V] = svd (F2);
[F3U,F3S,F3V] = svd (F3);

%disp(diag(F1S));
for i=1:1:2

f1(i)=sqrt(F1S(i,i));
f2(i)=sqrt(F2S(i,i));
f3(i)=sqrt(F3S(i,i));
end
%disp(f1);



r2=f1(1)^4;


G1=zeros(2,svd1d,svd1d,svd1d,svd1d);
G2=zeros(2,svd1d,svd1d,svd1d,svd1d);
G3=zeros(2,svd1d,svd1d,svd1d,svd1d);

for i=1:1:2
for ka=1:1:Fsize
    ka1=mod((ka-1),(svd1d*svd1d))+1;
    ka2=(ka-ka1)/(svd1d*svd1d)+1;
    k1=mod((ka1-1),svd1d)+1;
    k2=(ka1-k1)/svd1d+1;
    k3=mod((ka2-1),svd1d)+1;
    k4=(ka2-k3)/svd1d+1; 
    
    G1(i,k1,k2,k3,k4)=F1U(ka,i)*f1(i);
    G2(i,k1,k2,k3,k4)=F2U(ka,i)*f2(i);
    G3(i,k1,k2,k3,k4)=F3U(ka,i)*f3(i);
end
end


H=zeros(4,4,4);


tensorsH = {G1,G1,G2,G2,G3,G3};

legLinksH = {[-1 1 2 3 4],[-6 5 6 7 8],[-2 2 10 6 11],[-3 4 12 8 9],[-4 3 11 7 12],[-5 1 9 5 10]};
sequenceH = [9 10 11 12 1 2 3 4 5 6 7 8];
HH = ncon(tensorsH,legLinksH,sequenceH);


for a1=1:1:2
    for a2=1:1:2
         for a3=1:1:2    
               for a4=1:1:2  
                    for a5=1:1:2
                         for a6=1:1:2



                                             i=(a5-1)*2+a1;
                                             j=(a3-1)*2+a4;
                                             k=(a2-1)*2+a6;
                                             H(i,j,k)=HH(a1,a2,a3,a4,a5,a6);                                         
                                            
                         end
                    end
               end
         end
    end 
end

H=H./r2;  

%disp(H);
Tout=H;

end

