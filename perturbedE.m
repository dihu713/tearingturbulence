itime =225;

Pi = 3.141592653589793;

taEmx = zeros(nx,1);
taEkx = zeros(nx,1);

B20x = zeros(nx,1);
B02x = zeros(nx,1);

[nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',itime);
[nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);
[nx,ny,nz,time,x,y,z,bz]=rd3dhdf('bz',itime);

[nx,ny,nz,time,x,y,z,vx]=rd3dhdf('vx',itime);
[nx,ny,nz,time,x,y,z,vy]=rd3dhdf('vy',itime);
[nx,ny,nz,time,x,y,z,vz]=rd3dhdf('vz',itime);



for ix = 1 : nx
    
    FFTBx;
    FFTBy;
    FFTD;
    
    FFTvx;
    FFTvy;
    FFTvz;
    
    B20x(ix) = Bx20+By20+Bz20;
    B02x(ix) = Bx0*Bx0+By0*By0+Bz0*Bz0;
    
    taEm = Bx20+By20+Bz20-Bx0*Bx0-By0*By0-Bz0*Bz0;
    taEk = vx20+vy20+vz20-vx0*vx0-vy0*vy0-vz0*vz0;
    
    taEmx(ix) = taEm;
    taEkx(ix) = taEk;
    
end