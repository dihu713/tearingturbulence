itime = 145;
ix = 502;

[nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',itime);
[nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);
[nx,ny,nz,time,x,y,z,bz]=rd3dhdf('bz',itime);

[nx,ny,nz,time,x,y,z,vx]=rd3dhdf('vx',itime);
[nx,ny,nz,time,x,y,z,vy]=rd3dhdf('vy',itime);
[nx,ny,nz,time,x,y,z,vz]=rd3dhdf('vz',itime);

FFTBx3D;
FFTBy3D;
FFTBz3D;

FFTvx3D;
FFTvy3D;
FFTvz3D;

transformation;
intkper;

%hold on;
plot(coordkper,logEmkper,'k-','LineWidth',2);
%hold off;

%hold on;
%plot(coordkper,logEkkper,'b--','LineWidth',2);
%hold off;
set(gca,'xscale','log');