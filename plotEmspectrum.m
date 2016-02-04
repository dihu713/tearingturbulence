clf('reset');
%{
ntime = 385;

coordt = zeros(ntime,1);

for it = 1: ntime
    [nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',it);
    coordt(it) = time;
end
%}
specttime = zeros(4,1);
specttimereal = zeros(4,1);

ix = 502;

specttime(1) = 5;
specttime(2) = 50;
specttime(3) = 100;
specttime(4) = 150;

p_str = {'g-','b-','r-','k-'};

for ispect = 1:4
    
    itime = specttime(ispect);
    %{
    [nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',itime);
    [nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);
    [nx,ny,nz,time,x,y,z,bz]=rd3dhdf('bz',itime);
    
    [nx,ny,nz,time,x,y,z,vx]=rd3dhdf('vx',itime);
    [nx,ny,nz,time,x,y,z,vy]=rd3dhdf('vy',itime);
    [nx,ny,nz,time,x,y,z,vz]=rd3dhdf('vz',itime);
    
    FFTBx;
    FFTBy;
    FFTD;
    
    FFTvx;
    FFTvy;
    FFTvz;
    
    transformation;
    intkper;
    
    hold on;
    plot(coordkper,logEmkper,p_str{ispect},'LineWidth',2);
    hold off;
    
    %hold on;
    %plot(coordkper,logEkkper,'b--','LineWidth',2);
    %hold off;
    %}
    
    [nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',itime);
    specttimereal(ispect) = time;
    
    %{
    if itime <1500
        genspectalt;
    else
        genaveragespectalt;
    end
    %}
    
    genspectalt;
    
end

set(gca,'xscale','log');

xlabel('$k_\bot$','Interpreter','LaTex','FontSize',20);
ylabel('$\log_{10}{\left(E_m\right)}$','Interpreter','LaTex','FontSize',20);

l_str1 = sprintf('t=%f',specttimereal(1));
l_str2 = sprintf('t=%f',specttimereal(2));
l_str3 = sprintf('t=%f',specttimereal(3));
l_str4 = sprintf('t=%f',specttimereal(4));

s_legend=legend(l_str1,l_str2,l_str3,l_str4);
set(s_legend,'Interpreter','LaTex','FontSize',20);

ylim([-12,0]);
xlim([1,1e3]);