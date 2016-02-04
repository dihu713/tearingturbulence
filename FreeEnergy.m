Pi = 3.141592653589793;

%bx1 = bx(100,1:250,1:250);
%bx1 = squeeze(bx1);

%comfft = fft2(bx1);

byFE = jz(3:nx-2,ny/2,nz/2);
byFE = squeeze(byFE);

FEfft = fft(byFE);

FEfft = FEfft*(2/(nx-4));
FEfft(1) = FEfft(1)/2;
FEfft = fftshift(FEfft);

reFEfft = abs(real(FEfft))+1e-20;
imFEfft = abs(imag(FEfft))+1e-20;