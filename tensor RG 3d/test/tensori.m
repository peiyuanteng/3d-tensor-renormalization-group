function x=tensori(T,h)
%t=zeros(16,16,16,16,16,16);
x=zeros(4,4,4);
value=0;
for a1=-1:2:1
    for a2=-1:2:1
         for a3=-1:2:1    
               for a4=-1:2:1   
                    for a5=-1:2:1
                         for a6=-1:2:1

                                             value=ising(a1,a2,a3,a4,a5,a6,T,h);
                                             l1=convert(a1);
                                             l2=convert(a2);
                                             l3=convert(a3);
                                             l4=convert(a4);
                                             l5=convert(a5);
                                             l6=convert(a6);
                                           
                                             i=(l5-1)*2+l1;
                                             j=(l3-1)*2+l4;
                                             k=(l2-1)*2+l6;
                                             %t(l1,l2,l3,l4,l5,l6)=value;
                                             x(i,j,k)=value;
                                            
                                            

                                             
                         end
                    end
               end
         end
    end 
end






end
 
function y=convert(x)
if (x==-1) y=1; end
if (x==1) y=2; end
end