itime =1;
%{
Bypro=zeros(nx,1);
[nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);

for ix = 1 : nx
    FFTBy;

    Bypro(ix) = By0;
    
end
%}

[nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);
FFTBy3D;

plot(x,By0,'b--','LineWidth',2);

itime =160;
%{
Bypro=zeros(nx,1);
[nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);

for ix = 1 : nx
    FFTBy;

    Bypro(ix) = By0;
    
end
%}

[nx,ny,nz,time,x,y,z,by]=rd3dhdf('by',itime);
FFTBy3D;

hold on;
plot(x,By0,'rx-','LineWidth',2);
hold off;

%Btanh;
%hold on;
%plot(x,Bytanh,'k--','LineWidth',2);
%hold off;