kunit = 3*pi;

nkper = round(max(max(kper/kunit)));

coordkper = linspace(1,kunit*nkper,nkper);
Bxkper = zeros(nkper,1);
Bykper = zeros(nkper,1);
Bzkper = zeros(nkper,1);

Emkper = zeros(nkper,1);
Ekkper = zeros(nkper,1);

for iy = 1: nsizeky
    for iz = 1 : nsizekz
        
        ikper = round(kper(iz,iy)/(kunit));
        
        if (ikper~=0)
            Bxkper(ikper) = Bxkper(ikper) + ximfft(iz,iy,ix)/kper(iz,iy);
            Bykper(ikper) = Bykper(ikper) + yimfft(iz,iy,ix)/kper(iz,iy);
            Bzkper(ikper) = Bzkper(ikper) + zimfft(iz,iy,ix)/kper(iz,iy);
            
            Emkper(ikper) = Emkper(ikper) + xEmfft(iz,iy,ix)/kper(iz,iy);
            Emkper(ikper) = Emkper(ikper) + yEmfft(iz,iy,ix)/kper(iz,iy);
            Emkper(ikper) = Emkper(ikper) + zEmfft(iz,iy,ix)/kper(iz,iy);
            
            Ekkper(ikper) = Ekkper(ikper) + vxEmfft(iz,iy,ix)/kper(iz,iy);
            Ekkper(ikper) = Ekkper(ikper) + vyEmfft(iz,iy,ix)/kper(iz,iy);
            Ekkper(ikper) = Ekkper(ikper) + vzEmfft(iz,iy,ix)/kper(iz,iy);
        end
        
    end
end

%Bxkper=Bxkper/(2*pi);
%Bykper=Bykper/(2*pi);
%Bzkper=Bzkper/(2*pi);
%Emkper=Emkper/(2*pi);
%Ekkper=Ekkper/(2*pi);

logEmkper = log10(Emkper);
logEkkper = log10(Ekkper);