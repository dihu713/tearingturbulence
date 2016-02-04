ntime =287;

[nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',1);

coordt = zeros(ntime,1);

maxBxt = zeros(ntime,nx);
maxEmxt = zeros(ntime,nx);

for it = 1 : ntime
    [nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',it);
    for ix = 1 : nx
        
        FFTBx;
        
        maxBx = max(max(imfft));
        maxEmx = sum(sum(Emfft));
        
        coordt(it) = time;
        
        maxBxt(it,ix) = maxBx;
        maxEmxt(it,ix) = maxEmx;
        
    end
end