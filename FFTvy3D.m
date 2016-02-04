Pi = 3.141592653589793;
vy1 = vy(:,3:ny-2,3:nz-2);

%The third column will now act as x label
vy1 = permute(vy1,[3,2,1]);

vy2 = vy1.*vy1;

comfft = fft2(vy2);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

%By20 = zeros(nx,1);
vy20 = squeeze(real(comfft(1,1,:)));

comfft = fft2(vy1);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

vy0 = squeeze(real(comfft(1,1,:)));

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

vylogrefft = flplogrefft((nsizekz/2)+1:nsizekz,(nsizeky/2):nsizeky-1,:);
vylogimfft = flplogimfft((nsizekz/2)+1:nsizekz,(nsizeky/2):nsizeky-1,:);
vylogEmfft = flplogEmfft((nsizekz/2)+1:nsizekz,(nsizeky/2):nsizeky-1,:);

vyrefft = 10.^vylogrefft;
vyimfft = 10.^vylogimfft;
vyEmfft = 10.^vylogEmfft;