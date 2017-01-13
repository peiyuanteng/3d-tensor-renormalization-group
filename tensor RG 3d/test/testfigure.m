figure
subplot(2,2,1)       % add first plot in 2 x 2 grid

[x,y]=test(2,0);
semilogx(x,y);
semilogy(x,y,'-s');
xlabel('r','FontSize', 15);
ylabel('error','FontSize', 15);
grid on;
title('(T,h)=(2,0)','FontSize', 15)

subplot(2,2,2)       % add second plot in 2 x 2 grid
[x,y]=test(4,0);
semilogx(x,y);
semilogy(x,y,'-s');
xlabel('r','FontSize', 15);
ylabel('error','FontSize', 15);
grid on;
title('(T,h)=(4,0)','FontSize', 15)

subplot(2,2,3)       % add third plot in 2 x 2 grid
[x,y]=test(4,2);
semilogx(x,y);
semilogy(x,y,'-s');
xlabel('r','FontSize', 15);
ylabel('error','FontSize', 15);
grid on;
title('(T,h)=(4,2)','FontSize', 15)

subplot(2,2,4)       % add fourth plot in 2 x 2 grid
[x,y]=test(4,4);
semilogx(x,y);
semilogy(x,y,'-s');
xlabel('r','FontSize', 15);
ylabel('error','FontSize', 15);
grid on;
title('(T,h)=(4,4)','FontSize', 15)