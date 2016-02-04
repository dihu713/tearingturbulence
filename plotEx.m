itime=180;

plot(x,taEkxt(itime,:),'r--','LineWidth',2);
hold on;
plot(x,taEmxt(itime,:),'k--','LineWidth',2);
hold off;

xlabel('x','FontSize',20);
ylabel('$\left<\tilde{f}^2\right>$','Interpreter','LaTex','FontSize',20);

s_legend=legend('$\left<\tilde{v}^2\right>$','$\left<\tilde{B}^2\right>$');
set(s_legend,'Interpreter','LaTex','FontSize',20);

xlim([-1,1]);
titlestr = sprintf('t=%f',coordt(itime));
title(titlestr,'FontSize',20);