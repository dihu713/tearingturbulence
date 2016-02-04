Pi = 3.141592653589793;
bz1 = bz(:,3:ny-2,3:nz-2);

%The third column will now act as x label
bz1 = permute(bz1,[3,2,1]);

bz2 = bz1.*bz1;

comfft = fft2(bz2);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

%By20 = zeros(nx,1);
Bz20 = squeeze(real(comfft(1,1,:)));

comfft = fft2(bz1);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

Bz0 = squeeze(real(comfft(1,1,:)));
