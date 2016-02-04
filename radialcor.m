itime =215;

mnum=2;
nnum=1;

[nx,ny,nz,time,x,y,z,bx]=rd3dhdf('bx',itime);
[nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);
[nx,ny,nz,time,x,y,z,bz]=rd3dhdf('bz',itime);

[nx,ny,nz,time,x,y,z,jz]=rd3dhdf('jz',itime);

Bxmn=zeros(nx,1);
Q=zeros(nx,1);
Bypro=zeros(nx,1);
Bzpro=zeros(nx,1);
Jpro=zeros(nx,1);

for ix = 1: nx
    FFTBx;
    FFTBy;
    FFTD;
    FFTJz;
    
    Bxmn(ix) = xEmfft(nnum+1,mnum+1);
    
    %By0 = yrefft(1,1);
    %Bz0 = zrefft(1,1);
    
    %Jz0 = jrefft(1,1);
    %if(x(ix)~=0)
    %    Jz0 = -Jz0*x(ix)/abs(x(ix));
    %end
    
    Q(ix) = (Bz0*2)/(By0*10);
    Jpro(ix) = Jz0;
    Bypro(ix) = By0;
    Bzpro(ix) = Bz0;
    
end

%hold on;
plot(x,Bxmn,'rx-','LineWidth',2);
%hold off;