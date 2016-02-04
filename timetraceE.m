ntime =417;

[nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',1);

coordt = zeros(ntime,1);

taEkxt = zeros(ntime,nx);
taEmxt = zeros(ntime,nx);

%taEkxt = zeros(ntime,1);
%taEmxt = zeros(ntime,1);

for it = 1 : ntime
    
    [nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',it);
    [nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',it);
    [nx,ny,nz,time,x,y,z,bz]=rd3dhdf('bz',it);
    
    %[nx,ny,nz,time,x,y,z,vx]=rd3dhdf('vx',it);
    %[nx,ny,nz,time,x,y,z,vy]=rd3dhdf('vy',it);
    %[nx,ny,nz,time,x,y,z,vz]=rd3dhdf('vz',it);
    
    FFTBx3Dsimple;
    FFTBy3Dsimple;
    FFTBz3Dsimple;
    
    taEm = Bx20+By20+Bz20-Bx0.*Bx0-By0.*By0-Bz0.*Bz0;
    %taEk = vx20+vy20+vz20-vx0.*vx0-vy0.*vy0-vz0.*vz0;
    coordt(it) = time;
    
    %taEkxt(it,:) = taEk;
    taEmxt(it,:) = taEm;
    
    if (it/10) == floor(it/10)
        disp(it);
    end
    
    %{
    for ix = 502 : 502
        
        FFTBx;
        FFTBy;
        FFTD;
        
        %FFTvx;
        %FFTvy;
        %FFTvz;
        
        taEm = Bx20+By20+Bz20-Bx0*Bx0-By0*By0-Bz0*Bz0;
        %taEk = vx20+vy20+vz20-vx0*vx0-vy0*vy0-vz0*vz0;
        
        coordt(it) = time;
        
        %taEkxt(it,ix) = taEk;
        %taEmxt(it,ix) = taEm;
        
        %taEkxt(it) = taEk;
        taEmxt(it) = taEm;
        
    end
    %}
end