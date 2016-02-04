itime = 150;
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

totEmfft = xEmfft+yEmfft+zEmfft;
totEkfft = vxEmfft+vyEmfft+vzEmfft;

totEmfft = log10(totEmfft);
totEkfft = log10(totEkfft);

pcm = pcolor(pcoordky,pcoordkz,squeeze(totEmfft(:,:,ix)));
hold on;
contour(pcoordky,pcoordkz,kpar/10000,'k--','LineWidth',2);
contour(pcoordky,pcoordkz,kper/10000,'r--','LineWidth',2);
hold off;

xlabel('m','FontSize',20);
ylabel('n','FontSize',20);

set(pcm,'EdgeColor','none');
cb = colorbar('southoutside');
ylabel(cb,'log_{10}{E_m}','FontSize',15);

colormap('jet');

figure;

pck = pcolor(pcoordky,pcoordkz,squeeze(totEkfft(:,:,ix)));
hold on;
contour(pcoordky,pcoordkz,kpar/10000,'k--','LineWidth',2);
contour(pcoordky,pcoordkz,kper/10000,'r--','LineWidth',2);
hold off;

xlabel('m','FontSize',20);
ylabel('n','FontSize',20);

set(pck,'EdgeColor','none');
cb = colorbar('southoutside');
ylabel(cb,'log_{10}{E_k}','FontSize',15);

colormap('jet');