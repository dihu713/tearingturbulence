%By0 = yrefft(1,1,ix);
%Bz0 = zrefft(1,1,ix);
[~,nsizeky] = size(pcoordky);
[~,nsizekz] = size(pcoordkz);
kpar = zeros(nsizekz,nsizeky);
kper = zeros(nsizekz,nsizeky);

Y0 = 4;
Z0 = 4;
R0 = Z0/(2*Pi);

gm = By0(ix)*Z0/(Bz0(ix)*Y0);

for iy = 1: nsizeky
    for iz = 1 : nsizekz
        
        if (pcoordky(iy)~=0)
            kpar(iz,iy) = (gm-(pcoordkz(iz)/pcoordky(iy)))*pcoordky(iy)/R0;
        else
            kpar(iz,iy) = -pcoordkz(iz)/R0;
        end
        
        kper(iz,iy) = 4*pi*pi*((pcoordky(iy)*pcoordky(iy)/(Y0*Y0))+pcoordkz(iz)*pcoordkz(iz)/(Z0*Z0));
        kper(iz,iy) = sqrt(kper(iz,iy));
    end
end



