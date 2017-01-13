function [x,y]=test(T,h)
y(6)=0;
x(6)=0;
for i=1:1:6
    x(i)=2^(i-1);
    y(i)=abs(testcpd(T,h,x(i)));
end


end