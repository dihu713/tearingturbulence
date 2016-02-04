Pi = 3.141592653589793;
by1 = by(:,3:ny-2,3:nz-2);

%The third column will now act as x label
by1 = permute(by1,[3,2,1]);

by2 = by1.*by1;

comfft = fft2(by2);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

%By20 = zeros(nx,1);
By20 = squeeze(real(comfft(1,1,:)));

comfft = fft2(by1);

comfft = comfft*(2/(ny-4))*(2/(nz-4));
comfft(1,:,:) = comfft(1,:,:)/2;
comfft(:,1,:) = comfft(:,1,:)/2;

By0 = squeeze(real(comfft(1,1,:)));
