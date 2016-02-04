Pi = 3.141592653589793;
bx1 = bx(:,3:ny-2,3:nz-2);

%The third column will now act as x label
bx1 = permute(bx1,[3,2,1]);

bx2 = bx1.*bx1;

comfft = fft2(bx2);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

%Bx20 = zeros(nx,1);
Bx20 = squeeze(real(comfft(1,1,:)));

comfft = fft2(bx1);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

Bx0 = squeeze(real(comfft(1,1,:)));
