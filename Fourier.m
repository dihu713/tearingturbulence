k = 100;
Pi = 3.141592653589793;
ky = 0;
kz = 0;

powerk1 = zeros(nx,k,k);
powerk2 = zeros(nx,k,k);
interm = zeros(1,ny);

power0 = zeros(1,nx);

for ix = 1 : nx
    %fprintf('Performing background average for: %d', ix);
    
    bx1 = bx(ix,:,:);
    bx1 = squeeze(bx1);
    for i = 1: ny;
        
        for j = 1 : nz;
            interm(i) = interm(i) + bx1(i,j);
        end
        
        interm(i) = interm(i) - bx1(i,1)/2;
        interm(i) = interm(i) - bx1(i,nz)/2;
        interm(i) = interm(i)*(z(nz)-z(1))/nz;
        interm(i) = interm(i)/z(nz);
        
        power0(ix) = power0(ix) + interm(i);
        
    end
    power0(ix) = power0(ix) - interm(1)/2;
    power0(ix) = power0(ix) - interm(ny)/2;
    power0(ix) = power0(ix)*(y(ny)-y(1))/ny;
    power0(ix) = power0(ix)/y(ny);
end

interm = zeros(1,ny);


for ix = 1 : nx
    
    fprintf('Integrating for radial element: %d\r\n', ix);
    
    bx1 = bx(ix,:,:);
    bx1 = squeeze(bx1);
    
    for ky = 1 : k
        for kz = 1 : k            
            for i = 1: ny
                %interm = zeros(1,ny);
                for j = 1 : nz
                    interm(i) = interm(i) + bx1(i,j)*cos(2*Pi*kz*z(j)/z(nz));
                end

                interm(i) = interm(i) - bx1(i,1)*cos(2*Pi*kz*z(1)/z(nz))/2;
                interm(i) = interm(i) - bx1(i,nz)*cos(2*Pi*kz*z(nz)/z(nz))/2;
                interm(i) = interm(i)*(z(nz)-z(1))/nz;
                interm(i) = interm(i)*2/z(nz);
                
                powerk1(ix,ky,kz) = powerk1(ix,ky,kz) + interm(i)*cos(2*Pi*ky*y(i)/y(ny));
                
            end
            powerk1(ix,ky,kz) = powerk1(ix,ky,kz) - interm(1)*cos(2*Pi*ky*y(1)/y(ny))/2;
            powerk1(ix,ky,kz) = powerk1(ix,ky,kz) - interm(ny)*cos(2*Pi*ky*y(ny)/y(ny))/2;
            powerk1(ix,ky,kz) = powerk1(ix,ky,kz)*(y(ny)-y(1))/ny;
            powerk1(ix,ky,kz) = powerk1(ix,ky,kz)*2/y(ny);
        end
    end
    
end

interm = zeros(1,ny);


for ix = 1 : nx
    
    fprintf('Integrating for radial element: %d\r\n', ix);
    
    bx1 = bx(ix,:,:);
    bx1 = squeeze(bx1);
    
    for ky = 1 : k
        for kz = 1 : k            
            for i = 1: ny
                %interm = zeros(1,ny);
                for j = 1 : nz
                    interm(i) = interm(i) + bx1(i,j)*sin(2*Pi*kz*z(j)/z(nz));
                end

                interm(i) = interm(i) - bx1(i,1)*cos(2*Pi*kz*z(1)/z(nz))/2;
                interm(i) = interm(i) - bx1(i,nz)*cos(2*Pi*kz*z(nz)/z(nz))/2;
                interm(i) = interm(i)*(z(nz)-z(1))/nz;
                interm(i) = interm(i)*2/z(nz);
                
                powerk2(ix,ky,kz) = powerk2(ix,ky,kz) + interm(i)*cos(2*Pi*ky*y(i)/y(ny));
                
            end
            powerk2(ix,ky,kz) = powerk2(ix,ky,kz) - interm(1)*cos(2*Pi*ky*y(1)/y(ny))/2;
            powerk2(ix,ky,kz) = powerk2(ix,ky,kz) - interm(ny)*cos(2*Pi*ky*y(ny)/y(ny))/2;
            powerk2(ix,ky,kz) = powerk2(ix,ky,kz)*(y(ny)-y(1))/ny;
            powerk2(ix,ky,kz) = powerk2(ix,ky,kz)*2/y(ny);
        end
    end
    
end

coordky=linspace(1,k,k);
coordkz=linspace(1,k,k);
powerkx=powerk2(127,:,:);
powerkx=squeeze(powerkx);