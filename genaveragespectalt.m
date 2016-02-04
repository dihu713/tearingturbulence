refit = itime;
widit = 6;

Emkpermean = zeros(nkper,1);
Ekkpermean = zeros(nkper,1);

for itime = refit - widit : 1 : refit + widit
    %itime = 165;
    %ix = 502;
    
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
    
    Emkpermean = Emkpermean + (Emkper/(1+2*widit));
    Ekkpermean = Ekkpermean + (Ekkper/(1+2*widit));
end

logEmkpermean = log10(Emkpermean);
logEkkpermean = log10(Ekkpermean);

hold on;
%plot(coordkper,logEmkpermean,'k-','LineWidth',2);
plot(coordkper,logEmkper,p_str{ispect},'LineWidth',2);
hold off;

%hold on;
%plot(coordkper,logEkkper,'b--','LineWidth',2);
%hold off;
%set(gca,'xscale','log');