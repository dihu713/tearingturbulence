clf('reset');

%ix =502;
%itime = 150;

genspect;
%genspectalt;
%genaveragespect;
fitting;

set(gca,'xscale','log');

xlabel('$k_\bot$','Interpreter','LaTex','FontSize',20);
ylabel('$\log_{10}{\left(E_m\right)}$','Interpreter','LaTex','FontSize',20);

s_legend=legend('$\log_{10}{E_m\left(k_\bot\right)}$','exponential fall','simple power law');
set(s_legend,'Interpreter','LaTex','FontSize',20);
axis([1 1e3 -18 2]);
