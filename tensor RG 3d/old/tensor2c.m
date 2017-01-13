function [Tout,r1,r2]=tensor2c(Tin)
format long;
step=1;
A=tensor(Tin);
Re=cp_opt(A,1,'init','nvecs');
A0=Re.lambda;
disp(A0);
A1=full(Re.U{1});
A2=full(Re.U{2});
A3=full(Re.U{3});
number=0;
r=1;
for i=1:1:step
A1(:,i)=A1(:,i)*Re.lambda(i)^(1/3);
A2(:,i)=A2(:,i)*Re.lambda(i)^(1/3);
A3(:,i)=A3(:,i)*Re.lambda(i)^(1/3);
end

B1=zeros(2,2,1);
B2=zeros(2,2,1);
B3=zeros(2,2,1);
for i=1:1:step
for j=1:1:4
    j2=mod((j-1),2)+1;
    j1=(j-j2)/2+1;
    B1(j1,j2,i)=A1(j,i);
    B2(j1,j2,i)=A2(j,i);
    B3(j1,j2,i)=A3(j,i);
    
end
end
C1=zeros(2,2,1,1);
C2=zeros(2,2,1,1);
C3=zeros(2,2,1,1);

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
D1=zeros(2,2);
D2=zeros(2,2);
D3=zeros(2,2);

for i1=1:1:step
    for i2=1:1:step
        for j1=1:1:2
            for j2=1:1:2
            ja=j1;
            jb=j2;
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

for i=1:1:2
d1(i)=sqrt(D1S(i,i));
d2(i)=sqrt(D2S(i,i));
d3(i)=sqrt(D3S(i,i));
end

%ratio

r1=d1(1)^5;

E1=zeros(2,2,1,1);
E2=zeros(2,2,1,1);
E3=zeros(2,2,1,1);

for i=1:1:2
for k=1:1:2

    E1(i,k,step,step)=D1U(k,i)*d1(i);
    E2(i,k,step,step)=D2U(k,i)*d2(i);
    E3(i,k,step,step)=D3U(k,i)*d3(i);
end
end

F1=zeros(16,16);
F2=zeros(16,16);
F3=zeros(16,16);

for ka=1:1:16
    ka1=mod((ka-1),4)+1;
    ka2=(ka-ka1)/4+1;
    k1=mod((ka1-1),2)+1;
    k2=(ka1-k1)/2+1;
    k3=mod((ka2-1),2)+1;
    k4=(ka2-k3)/2+1; 
    
    for kb=1:1:16
    kb1=mod((kb-1),4)+1;
    kb2=(kb-kb1)/4+1;
    k5=mod((kb1-1),2)+1;
    k6=(kb1-k5)/2+1;
    k7=mod((kb2-1),2)+1;
    k8=(kb2-k7)/2+1; 
    

        
  for da=1:1:4
          d1=mod((da-1),2)+1;
    d2=(da-d1)/2+1;
  for db=1:1:4
    d3=mod((db-1),2)+1;
    d4=(db-d3)/2+1;                               
                                  F1(ka,kb)=F1(ka,kb)+E1(k1,d1,step,step)*E2(k2,d2,step,step)*E1(k3,d3,step,step)*E2(k4,d4,step,step)*E1(k5,d1,step,step)*E2(k6,d2,step,step)*E1(k7,d3,step,step)*E2(k8,d4,step,step);
                                  F2(ka,kb)=F2(ka,kb)+E1(k1,d1,step,step)*E3(k2,d2,step,step)*E1(k3,d3,step,step)*E3(k4,d4,step,step)*E1(k5,d1,step,step)*E3(k6,d2,step,step)*E1(k7,d3,step,step)*E3(k8,d4,step,step);
                                  F3(ka,kb)=F3(ka,kb)+E2(k1,d1,step,step)*E3(k2,d2,step,step)*E2(k3,d3,step,step)*E3(k4,d4,step,step)*E2(k5,d1,step,step)*E3(k6,d2,step,step)*E2(k7,d3,step,step)*E3(k8,d4,step,step);                                 
   end
  end
  

    end
  %  number=number+1;
          %      disp(number);
end

F1=F1./r1;
F2=F2./r1;
F3=F3./r1;


[F1U,F1S,F1V] = svd (F1);
[F2U,F2S,F2V] = svd (F2);
[F3U,F3S,F3V] = svd (F3);

for i=1:1:2

f1(i)=sqrt(F1S(i,i));
f2(i)=sqrt(F2S(i,i));
f3(i)=sqrt(F3S(i,i));
end

%ratio

r2=f1(1)^4;

G1=zeros(2,2,2,2,2);
G2=zeros(2,2,2,2,2);
G3=zeros(2,2,2,2,2);

for i=1:1:2
for ka=1:1:16
    ka1=mod((ka-1),4)+1;
    ka2=(ka-ka1)/4+1;
    k1=mod((ka1-1),2)+1;
    k2=(ka1-k1)/2+1;
    k3=mod((ka2-1),2)+1;
    k4=(ka2-k3)/2+1; 
    
    G1(i,k1,k2,k3,k4)=F1U(ka,i)*f1(i);
    G2(i,k1,k2,k3,k4)=F2U(ka,i)*f2(i);
    G3(i,k1,k2,k3,k4)=F3U(ka,i)*f3(i);
end
end
H=zeros(4,4,4);
number=0;

for a1=1:1:2
    for a2=1:1:2
         for a3=1:1:2    
               for a4=1:1:2  
                    for a5=1:1:2
                         for a6=1:1:2

for ka=1:1:16
    ka1=mod((ka-1),4)+1;
    ka2=(ka-ka1)/4+1;
    k1=mod((ka1-1),2)+1;
    k2=(ka1-k1)/2+1;
    k3=mod((ka2-1),2)+1;
    k4=(ka2-k3)/2+1; 
    
    for kb=1:1:16
    kb1=mod((kb-1),4)+1;
    kb2=(kb-kb1)/4+1;
    k5=mod((kb1-1),2)+1;
    k6=(kb1-k5)/2+1;
    k7=mod((kb2-1),2)+1;
    k8=(kb2-k7)/2+1; 
    
    for kc=1:1:16
    kc1=mod((kc-1),4)+1;
    kc2=(kc-kc1)/4+1;
    k9=mod((kc1-1),2)+1;
    k10=(kc1-k9)/2+1;
    k11=mod((kc2-1),2)+1;
    k12=(kc2-k11)/2+1; 
    

                                             i=(a5-1)*2+a1;
                                             j=(a3-1)*2+a4;
                                             k=(a2-1)*2+a6;
                                             H(i,j,k)=H(i,j,k)+G1(a1,k1,k2,k3,k4)*G1(a6,k5,k6,k7,k8)*G2(a2,k2,k10,k6,k11)*G2(a3,k4,k12,k8,k9)*G3(a4,k3,k11,k7,k12)*G3(a5,k1,k9,k5,k10);
        end 
    end
end

                         end
                    end
               end
         end
    end 
end

  
H=H./r2;  

r=r1*r2;
%disp(H);
Tout=H;
end
