Pi = 3.141592653589793;
vx1 = vx(:,3:ny-2,3:nz-2);

%The third column will now act as x label
vx1 = permute(vx1,[3,2,1]);

vx2 = vx1.*vx1;

comfft = fft2(vx2);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

%By20 = zeros(nx,1);
vx20 = squeeze(real(comfft(1,1,:)));

comfft = fft2(vx1);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

vx0 = squeeze(real(comfft(1,1,:)));

comfft = fftshift(comfft,1);
comfft = fftshift(comfft,2);
%comfft = comfft';
%absfft =abs(comfft);
%tmptest = comfft;

%{
for iy = 1 : ny
    if (iy<=ceil(ny/2))
        tmptest(iy+floor((ny/2)),:) = comfft(iy,:);
        %fprintf('%d to %d\r\n',i,i+floor((number/2)));
    else
        tmptest(iy+floor((ny/2)-ny),:) = comfft(iy,:);
        %fprintf('%d to %d\r\n',i,i+floor((number/2)-number));
    end
end

comfft = tmptest;

for jz = 1 : nz
    if (jz<=ceil(nz/2))
        tmptest(:,jz+floor((nz/2))) = comfft(:,jz);
        %fprintf('%d to %d\r\n',j,j+floor((number/2)));
    else
        tmptest(:,jz+floor((nz/2)-nz)) = comfft(:,jz);
        %fprintf('%d to %d\r\n',j,j+floor((number/2)-number));
    end
end

comfft = tmptest';
%}

refft = abs(real(comfft))+1e-20;
imfft = abs(imag(comfft))+1e-20;
logrefft = log10(refft);
logimfft = log10(imfft);

Emfft = (abs(comfft)+1e-40).^2;
logEmfft = log10(Emfft);

coordky = linspace(floor(-(ny-1-4)/2),floor((ny-1-4)/2),ny-4);
coordkz = linspace(floor(-(nz-1-4)/2),floor((nz-1-4)/2),nz-4);

flplogimfft = fliplr(logimfft);
flplogrefft = fliplr(logrefft);
flplogEmfft = fliplr(logEmfft);

[~,nsizeky] = size(coordky);
pcoordky = coordky((nsizeky/2)+1:nsizeky);

[~,nsizekz] = size(coordkz);
pcoordkz = coordkz((nsizekz/2)+1:nsizekz);

vxlogrefft = flplogrefft((nsizekz/2)+1:nsizekz,(nsizeky/2):nsizeky-1,:);
vxlogimfft = flplogimfft((nsizekz/2)+1:nsizekz,(nsizeky/2):nsizeky-1,:);
vxlogEmfft = flplogEmfft((nsizekz/2)+1:nsizekz,(nsizeky/2):nsizeky-1,:);

vxrefft = 10.^vxlogrefft;
vximfft = 10.^vxlogimfft;
vxEmfft = 10.^vxlogEmfft;