%将u(t)分解为奇部分和偶部分
syms t;
u=2*t^3+4*t^2-2;
l=subs(u,t,-t);
ue=0.5*(l+u);
uo=0.5*(u-l);
subplot(3,1,1);
fplot(t,u);
title('Your signal u(t)');
subplot(3,1,2);
fplot(t,ue);
title('Even part');
subplot(3,1,3);
fplot(t,uo);
title('Odd part');